require 'test/unit'

require_relative '../src/matrix'

class UnitTest < Test::Unit::TestCase
  test "get_cell_index_from_pos" do
    assert_equal 1, get_cell_index_from_pos(1, 1)
    assert_equal 20, get_cell_index_from_pos(3, 2)
  end

  test "get_cell" do
    matrix = "864371259325849761971265843436192587198657432257483916689734125713528694542916378"
    assert_equal "6", get_cell(matrix, 1, 2)
    assert_equal "8", get_cell(matrix, 5, 3)
  end

  test "set_cell" do
    matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
    assert_equal "014300209005009001070060043006002087190007400050083000600000105003508690042910300", set_cell(matrix, 1, 2, 1)
  end

  test "get_row" do
    matrix = "864371259325849761971265843436192587198657432257483916689734125713528694542916378"
    assert_equal "864371259", get_row(matrix, 1)
    assert_equal "198657432", get_row(matrix, 5)
  end

  test "get_col" do
    matrix = "864371259325849761971265843436192587198657432257483916689734125713528694542916378"
    assert_equal "839412675", get_col(matrix, 1)
    assert_equal "746958321", get_col(matrix, 5)
  end

  test "get_block" do
    matrix = "864371259325849761971265843436192587198657432257483916689734125713528694542916378"
    assert_equal "864325971", get_block(matrix, 1)
    assert_equal "192657483", get_block(matrix, 5)
  end

  test "get_block_index_from_pos" do
    assert_equal 2, get_block_index_from_pos(1, 4)
    assert_equal 6, get_block_index_from_pos(5, 7)
  end

  test "can_place_in_row?" do
    matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
    assert_equal true, can_place_in_row?(matrix, 1, 1)
    assert_equal false, can_place_in_row?(matrix, 1, 2)
  end

  test "can_place_in_col?" do
    matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
    assert_equal true, can_place_in_col?(matrix, 1, 2)
    assert_equal false, can_place_in_col?(matrix, 1, 1)
  end

  test "can_place_in_block?" do
    matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
    assert_equal true, can_place_in_block?(matrix, 1, 1)
    assert_equal false, can_place_in_block?(matrix, 1, 4)
  end

  test "can_place?" do
    matrix = "004300209005009001070060043006002087190007400050083000600000105003508690042910300"
    assert_equal true, can_place?(matrix, 4, 2, 3)
    assert_equal false, can_place?(matrix, 4, 2, 1)
  end

  test "count_unplaced" do
    assert_equal 5, count_unplaced("004300209")
  end

  test "count_placed" do
    assert_equal 4, count_placed("004300209")
  end
end
