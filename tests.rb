require 'minitest/autorun'
require './category_counter'
require 'pry'

class TestCategories < Minitest::Test
  def test_removes_duplicates
    filename = "./test_data/duplicates.txt"
    counter = CategoryCounter.new filename
    assert_equal 1, counter.lines.count
  end

  def test_counts_accurately
    filename = "./test_data/counts.txt"
    file = File.read filename
    counter = CategoryCounter.new filename
    CategoryCounter::LEGAL_CATEGORIES.map do |category|
      assert_equal 3, counter.category_counts[category]
    end
  end

  def test_removes_wrong_categories
    filename = "./test_data/wrong_categories.txt"
    counter = CategoryCounter.new filename
    assert_equal counter.lines.count, 0
  end

  def test_example
    filename = "./test_data/example.txt"
    counter = CategoryCounter.new filename
    assert_equal 2, counter.category_counts['PERSON']
    assert_equal 0, counter.category_counts['FOOD']
    assert_equal "PERSON Bob Jones", counter.lines[0]
  end
end
