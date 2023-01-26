require "pry"
require "yaml"

data = YAML.load_file("experiment_1.yaml")

class Pattern
  def self.parse_and_build(unparsed_pattern, timeout: 1)
    new(unparsed_pattern, timeout: timeout).parse_and_build
  end

  REGEX_PARSER = /\A\/(.*)\/([migonx]*)\z/

  def initialize(unparsed_pattern, timeout: 1)
    @unparsed_pattern = unparsed_pattern
    @pattern = unparsed_pattern
    @timeout = timeout
    @type = :simple
    @flags = []
    @global_search = false
  end

  def parse_and_build
    regex_parts = @unparsed_pattern.match(REGEX_PARSER)
    if regex_parts
      @flags = regex_parts[2].split("")
      flag_bits = []
      flag_bits << Regexp::IGNORECASE if @flags.include?("i")
      # flag_bits << Regexp::EXTENDED if @flags.include?("x") # disabled for now
      flag_bits << Regexp::MULTILINE if @flags.include?("m")
      # flag_bits << Regexp::NOENCODING if @flags.include?("n") # disabled for now
      @pattern = Regexp.new(regex_parts[1], flag_bits.sum, timeout: @timeout)
      @global_search = true if @flags.include?("g")
    end
    self
  end

  def inspect
    {
      type: @type,
      pattern: @pattern,
      flags: @flags,
      global_search: @global_search,
    }.inspect
  end

  def use_scan?
    !!@global_search
  end

  def find_matches(content)
    if use_scan?
      content.scan(@pattern)
    else
      content.match(@pattern)
    end
  end
end

string_pattern = Pattern.parse_and_build(data["stringPattern"])
simple_regex_pattern = Pattern.parse_and_build(data["simpleRegex"])
complex_regex_pattern = Pattern.parse_and_build(data["complexRegex"])

[string_pattern, simple_regex_pattern, complex_regex_pattern].each do |pattern|
  puts "Pattern: #{pattern.inspect}"
  data["content"].each do |content|
    puts "Content: #{content.inspect}"
    puts "Matches: #{pattern.find_matches(content)}"
  end
  puts
end
