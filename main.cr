require "parsec"

parser = Parsec.char('c')

p(parser)
p(parser.parse("c"))
p(parser.parse("d"))
