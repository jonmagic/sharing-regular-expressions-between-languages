const yaml = require('js-yaml')
const fs = require('fs')

const stringPattern = "hello world"
const contentOne = "we live in this hello world kind of place"

const simpleRegex = /(\d+)\.\s(\w+)/
const contentTwo = '1. one\n2. two\n3. three'
const simpleMatches = contentTwo.match(simpleRegex)
console.log(simpleMatches)

const complexRegex = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/ig
const contentThree = 'jonmagic@gmail.com\nfoo\nbob@acme.com'
const complexMatches = contentThree.match(complexRegex)
console.log(complexMatches)

const data = {
  stringPattern,
  simpleRegex: simpleRegex.toString(),
  complexRegex: complexRegex.toString(),
  content: [contentOne, contentTwo, contentThree],
}
console.log(data)

const yamlString = yaml.dump(data)
console.log(yamlString)

fs.writeFileSync('experiment_1.yaml', yamlString)
