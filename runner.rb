#!/usr/bin/ruby
require './categories'

def main
  if ARGV.empty?
    puts "Please enter a filename"
    exit(0)
  end
  begin
    raw_file = File.read ARGV[0]
    category_counts = CategoryCounter.count raw_file
    CategoryCounter.print_categories category_counts
  rescue => ex
    puts "Error: #{ex.message}\nPlease try again"
  end
  puts
  puts lines.join("\n")
end

main
