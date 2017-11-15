# SimpleParser

This parser is intended for parsing small simple languages. It is rather primitive. The main thing it has got going for itself is that the implementation is so simple that if you need to write support for some simple language and don't want to drag in too many dependencies, then this is simple code to hack and tweak.

I am using it as the foundation of two simple parsers. One for parsing ASCII plist files and the other for Go function signatures.

To use the parser, first create lexer for the `code` you are parsing. Then create a parser from this lexer and start parsing the top level statement or datastructure. 

    lexer = Lexer(code)
    parser = Parser(lexer)
    parse_toplevel(parser)

You implement your parse functions using:

* `look_ahead_type(parser)` to find the type of the token comming up. 
* `match(parser, token_type)` verify that look ahead token is what we expect and consume it.

The lexer implements the julia iterator interface so you iterate through each token in a regular for-loop. 

[![Build Status](https://travis-ci.org/ordovician/SimpleParser.jl.svg?branch=master)](https://travis-ci.org/ordovician/SimpleParser.jl)

[![Coverage Status](https://coveralls.io/repos/github/ordovician/SimpleParser.jl/badge.svg?branch=master)](https://coveralls.io/github/ordovician/SimpleParser.jl?branch=master)

[![codecov.io](http://codecov.io/github/ordovician/SimpleParser.jl/coverage.svg?branch=master)](http://codecov.io/github/ordovician/SimpleParser.jl?branch=master)
