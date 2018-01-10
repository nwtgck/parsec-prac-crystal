require "parsec"
require "crz"

def use_char()
    parser : Parsec::Parser(Char) = Parsec.char('c')
    p(parser)
    p(parser.parse("c"))
    p(parser.parse("d"))
end


def use_mdo()
    parser : Parsec::Parser(Array(Int32)) = mdo({
        _         <= Parsec.string("hello"),
        num_arr   <= Parsec.many_1(Parsec.digit),
        Parsec::Parser.of(num_arr.map{|e| e.to_i})
    })

    p(parser.parse("hello54613"))
    # => [5, 4, 6, 1, 3]
end

use_char()
use_mdo()