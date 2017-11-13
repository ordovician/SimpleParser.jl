module SimpleParser

export  Parser,
        look_ahead_type,
        next_token,
        match,
        Lexer,
        start,
        next,
        done,
        show,
        Token,
        NUMBER,
        STRING,
        UNKNOWN,
        EOF,
        LPAREN,
        RPAREN,
        LBRACE,
        RBRACE,
        COMMA,
        EQUAL,
        SEMICOLON

import Base: ==, start, next, done, show, match, iteratorsize

include("lexer.jl")
include("parser.jl")

end
