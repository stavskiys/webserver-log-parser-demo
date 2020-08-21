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

![ouput for example 1](https://github.com/stavskiys/webserver-log-parser-demo/blob/master/docs/images/example1.png)

`ruby parser.rb webserver.log by-uniq-views`

![ouput for example 2](https://github.com/stavskiys/webserver-log-parser-demo/blob/master/docs/images/example2.png)

`ruby parser.rb webserver.log by-views`

![ouput for example 3](https://github.com/stavskiys/webserver-log-parser-demo/blob/master/docs/images/example3.png)

## Run tests

`./run_tests`

![part of the output for tests](https://github.com/stavskiys/webserver-log-parser-demo/blob/master/docs/images/run_tests_example.png)

## Known issues

- No bundle support
- No ability to run all tests without reloading environment for each