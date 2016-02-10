#!/usr/bin/ruby
require './categories'

def main
  category_counts = CategoryCounter.count ARGV[0]
  CategoryCounter.print_categories category_counts
  puts
  puts lines.join("\n")
end

main
