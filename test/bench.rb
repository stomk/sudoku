require 'test/unit'

require_relative '../src/index'

class IntegrationTest < Test::Unit::TestCase
  def test_examples
    f = File.open("./test/bench_examples.csv")
    lines = f.readlines(chomp: true)
    lines.each do |line|
      input, output = line.split(",")
      result = solve(input)
      assert_equal output, result
    end
  end
end
