# Sharing regular expressions between languages

The first goal of this project is to show how to serialize a regular expression object in Javascript and then deserialize and use it in Ruby.

```bash
sharing-regular-expressions-between-languages on  main via ⬢ v16.14.2 via 💎 v3.2.0
➜ node experiment_1.js
[
  '1. one',
  '1',
  'one',
  index: 0,
  input: '1. one\n2. two\n3. three',
  groups: undefined
]
[ 'jonmagic@gmail.com', 'bob@acme.com' ]
{
  stringPattern: 'hello world',
  simpleRegex: '/(\\d+)\\.\\s(\\w+)/',
  complexRegex: '/(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])/gi',
  content: [
    'we live in this hello world kind of place',
    '1. one\n2. two\n3. three',
    'jonmagic@gmail.com\nfoo\nbob@acme.com'
  ]
}
stringPattern: hello world
simpleRegex: /(\d+)\.\s(\w+)/
complexRegex: >-
  /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/gi
content:
  - we live in this hello world kind of place
  - |-
    1. one
    2. two
    3. three
  - |-
    jonmagic@gmail.com
    foo
    bob@acme.com


sharing-regular-expressions-between-languages on  main via ⬢ v16.14.2 via 💎 v3.2.0
➜ ruby experiment_1.rb
Pattern: {:type=>:simple, :pattern=>"hello world", :flags=>[], :global_search=>false}
Content: "we live in this hello world kind of place"
Matches: hello world
Content: "1. one\n2. two\n3. three"
Matches:
Content: "jonmagic@gmail.com\nfoo\nbob@acme.com"
Matches:

Pattern: {:type=>:simple, :pattern=>/(\d+)\.\s(\w+)/, :flags=>[], :global_search=>false}
Content: "we live in this hello world kind of place"
Matches:
Content: "1. one\n2. two\n3. three"
Matches: 1. one
Content: "jonmagic@gmail.com\nfoo\nbob@acme.com"
Matches:

Pattern: {:type=>:simple, :pattern=>/(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/i, :flags=>["g", "i"], :global_search=>true}
Content: "we live in this hello world kind of place"
Matches: []
Content: "1. one\n2. two\n3. three"
Matches: []
Content: "jonmagic@gmail.com\nfoo\nbob@acme.com"
Matches: ["jonmagic@gmail.com", "bob@acme.com"]
```
