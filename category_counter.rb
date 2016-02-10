require 'set'

class CategoryCounter
  attr_reader :lines, :category_counts
  LEGAL_CATEGORIES = ['PERSON', 'PLACE', 'ANIMAL', 'COMPUTER', 'OTHER']

  def initialize filename
    raw_file= File.read filename
    @lines = get_lines raw_file
    set_counts
  end

  def set_counts
    @category_counts = {}
    @category_counts.default = 0
    @lines.map do |line|
      category = line.split[0]
      @category_counts[category] += 1
    end
  end

  def get_lines raw_file
    lines = raw_file.split("\n").compact
    lines = lines.uniq.reject{|line| line.empty?}
    lines = lines.reject do |line| 
      not LEGAL_CATEGORIES.include? line.split[0]
    end
  end

  def print_categories
    LEGAL_CATEGORIES.each do |category|
      puts "#{category} #{@category_counts[category]}"
    end
  end

  def print
    print_categories
    puts
    puts @lines.join("\n")
  end
end


