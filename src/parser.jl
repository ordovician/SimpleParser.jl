"Keeps track of current state of parsing."
mutable struct Parser
    lexer::Lexer
    look_ahead::Token
    current
    function Parser(lexer::Lexer)
       parser = new()
       parser.lexer = lexer
       parser.current = start(lexer)
       next_token(parser)
       return parser
    end
end

"Check type of upcomming token"
look_ahead_type(parser::Parser) = parser.look_ahead.typ

"Move to next token from lexer"
function next_token(parser::Parser)
     (parser.look_ahead, parser.current) = next(parser.lexer, parser.current)
end

"""
    match(parser, token_type)

Verify that next token is of type `token_type`, and if so, get next token.
"""
function match(parser::Parser, token_type::Int)
    if  look_ahead_type(parser) == token_type
        next_token(parser)
    else
        error("Expected $(Token(token_type)) but got $(parser.look_ahead)")
    end
end
