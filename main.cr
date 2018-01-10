require "parsec"
require "crz"

parser = Parsec.char('c')

p(parser)
p(parser.parse("c"))
p(parser.parse("d"))

parser = mdo({
  _         <= Parsec.string("hello"),
  num_arr   <= Parsec.many_1(Parsec.digit),
  Parsec::Parser.of(num_arr.map{|e| e.to_i})
})

p(parser.parse("hello54613"))
# => [5, 4, 6, 1, 3]