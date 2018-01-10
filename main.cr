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

def make_pasers1()
    # White space parser
    whilte_p : Parsec::Parser(Char) =
        Parsec.char(' ') | Parsec.char('\t') | Parsec.char('\n')
    # Number parser
    number_p : Parsec::Parser(Int32) =
        Parsec.many_1(Parsec.digit).map{|num_strs| num_strs.join.to_i}
    # 3 Numbers tuple
    three_numbers_p : Parsec::Parser(Tuple(Int32, Int32, Int32)) = 
        mdo({
            n1 <= number_p,
            _  <= whilte_p,
            n2 <= number_p,
            _  <= whilte_p,
            n3 <= number_p,
            Parsec::Parser.of({n1, n2, n3})
        })
    p(number_p.parse("4782"))
    p(three_numbers_p.parse("255 0 124"))
end

use_char()
use_mdo()
make_pasers1()