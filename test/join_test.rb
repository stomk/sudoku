require 'test/unit'

require_relative '../src/index'

class JoinTest < Test::Unit::TestCase
  sub_test_case "pick_cell" do
    test "with_filled_matrix" do
      matrix = "864371259325849761971265843436192587198657432257483916689734125713528694542916378"
      assert_equal nil, pick_cell(matrix)
    end

    test "with_unfilled_matrix" do
      matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
      assert_equal [7, 9], pick_cell(matrix)
    end
  end
end
