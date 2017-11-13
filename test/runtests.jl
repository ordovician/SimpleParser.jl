using SimpleParser
using Base.Test

# helper function for testing.
token_producer(s::String) = reverse([token for token in Lexer(s)])

plist_tokens = token_producer("{eggs = spam; foo = (bar, \"foo bar\");}")
strnum_tokens = token_producer("one 2 three 3 five")

@test pop!(plist_tokens) == Token(LBRACE, "{")
@test pop!(plist_tokens) == Token(STRING, "eggs")
@test pop!(plist_tokens) == Token(EQUAL, "=")
@test pop!(plist_tokens) == Token(STRING, "spam")
@test pop!(plist_tokens) == Token(SEMICOLON, ";")
@test pop!(plist_tokens) == Token(STRING, "foo")
@test pop!(plist_tokens) == Token(EQUAL, "=")
@test pop!(plist_tokens) == Token(LPAREN, "(")
@test pop!(plist_tokens) == Token(STRING, "bar")
@test pop!(plist_tokens) == Token(COMMA, ",")
@test pop!(plist_tokens) == Token(STRING, "foo bar")
@test pop!(plist_tokens) == Token(RPAREN, ")")
@test pop!(plist_tokens) == Token(SEMICOLON, ";")
@test pop!(plist_tokens) == Token(RBRACE, "}")
@test pop!(strnum_tokens) == Token(STRING, "one")
@test pop!(strnum_tokens) == Token(NUMBER, "2")
@test pop!(strnum_tokens) == Token(STRING, "three")
@test pop!(strnum_tokens) == Token(NUMBER, "3")
@test pop!(strnum_tokens) == Token(STRING, "five")

lexer = Lexer("{eggs = spam; foo = (bar, \"foo bar\");}")
p = Parser(lexer)
@test look_ahead_type(p) == LBRACE
next_token(p)
@test look_ahead_type(p) == STRING
next_token(p)
@test look_ahead_type(p) == EQUAL
next_token(p)
@test look_ahead_type(p) == STRING
next_token(p)
@test look_ahead_type(p) == SEMICOLON
next_token(p)
@test look_ahead_type(p) == STRING
next_token(p)
@test look_ahead_type(p) == EQUAL
next_token(p)
@test look_ahead_type(p) == LPAREN
next_token(p)
@test look_ahead_type(p) == STRING
next_token(p)
@test look_ahead_type(p) == COMMA
next_token(p)
@test look_ahead_type(p) == STRING
next_token(p)
@test look_ahead_type(p) == RPAREN
next_token(p)
@test look_ahead_type(p) == SEMICOLON
next_token(p)
@test look_ahead_type(p) == RBRACE
next_token(p)
@test look_ahead_type(p) == EOF

strange_tokens = token_producer("\"Dot(u Vector2D) float64\" \"()\$0\"")
@test pop!(strange_tokens) == Token(STRING, "Dot(u Vector2D) float64")
@test pop!(strange_tokens) == Token(STRING, "()\$0")
