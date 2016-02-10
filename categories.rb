require 'set'

LEGAL_CATEGORIES = ['PERSON', 'PLACE', 'ANIMAL', 'COMPUTER', 'OTHER']

def get_counts lines
  category_counts = {}
  category_counts.default = 0
  lines.map do |line|
    category = line.split[0]
    category_counts[category] += 1
  end
  category_counts
end

def get_lines
  lines = File.read ARGV[0]
  lines = lines.split("\n")
  lines = lines.uniq.reject{|line| line.empty?}
  lines = lines.reject do |line| 
    not LEGAL_CATEGORIES.include? line.split[0]
  end
end

def print_categories categories
  
  LEGAL_CATEGORIES.each do |category|
    puts "#{category} #{categories[category]}"
  end
end

def main
  lines = get_lines
  category_counts = get_counts lines
  print_categories category_counts
  puts
  puts lines.join("\n")
end

main
