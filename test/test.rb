require 'test/unit'

require_relative '../src/index'

class IntegrationTest < Test::Unit::TestCase
  def test_examples
    f = File.open("examples.csv")
    lines = f.readlines(chomp: true)
    lines.each do |line|
      input, output = line.split(",")
      assert_equal solve(input), output
    end
  end
end
