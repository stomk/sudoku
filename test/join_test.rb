require 'test/unit'

require_relative '../src/index'

class JoinTest < Test::Unit::TestCase
  def test_pick_cell
    filled_matrix = "864371259325849761971265843436192587198657432257483916689734125713528694542916378"
    assert_equal nil, pick_cell(filled_matrix)
    unfilled_matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
    assert_equal [8, 9], pick_cell(unfilled_matrix)
  end
end
