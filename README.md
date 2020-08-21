# Web server log parser (Demo version)

## Requirements

- ruby >= 2.4.5p335
- minitest >= 5.14.1
- mocha >= 1.11.2

## No bundle support. 

All required gems should be installed in manual mode

- `gem install minitest`
- `gem install mocha` 

and etc.


## Examples of usage

`ruby parser.rb webserver.log`

`ruby parser.rb webserver.log by-uniq-views`

`ruby parser.rb webserver.log by-views`

## Run tests

`./run_tests`

## Known issues

- No bundle support
- No ability to run all tests without reloading environment for each