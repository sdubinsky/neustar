require 'set'

module CategoryCounter
  LEGAL_CATEGORIES = ['PERSON', 'PLACE', 'ANIMAL', 'COMPUTER', 'OTHER']
  def self.get_counts lines
    category_counts = {}
    category_counts.default = 0
    lines.map do |line|
      category = line.split[0]
      category_counts[category] += 1
    end
    category_counts
  end

  def self.get_lines raw_file_string
    lines = raw_file_string.split("\n").compact
    lines = lines.uniq.reject{|line| line.empty?}
    lines = lines.reject do |line| 
      not LEGAL_CATEGORIES.include? line.split[0]
    end
  end

  def self.print_categories categories
    LEGAL_CATEGORIES.each do |category|
      puts "#{category} #{categories[category]}"
    end
  end

  def self.count raw_file
    lines = get_lines raw_file
    get_counts lines
  end
end


