require 'minitest/autorun'
require './categories'
require 'pry'

class TestCategories < Minitest::Test
  def test_removes_duplicates
    filename = "./test_data/duplicates.txt"
    lines = CategoryCounter.get_lines(filename)
    assert_equal 1, lines.count
  end

  def test_counts_accurately
    filename = "./test_data/counts.txt"
    categories = CategoryCounter.count filename
    CategoryCounter::LEGAL_CATEGORIES.map do |category|
      assert_equal 3, categories[category]
    end
  end

  def test_removes_wrong_categories
    filename = "./test_data/wrong_categories.txt"
    lines = CategoryCounter.get_lines filename
    assert_equal lines.count, 0
  end
end
