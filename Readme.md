#Coding Assignment - Scott Dubinsky


### category_counter.rb
This is a class that takes a filename, and counts the number of categories that occur in that class.  There is also a print method that prints the number of occurrences of each category and what the order was, with duplicates stripped out.

`set_counts` parses the array of lines to count them by category.  It uses a hash with a default of 0 to sum them up.

`get_lines` takes a string and parses it into an array.  It also removes duplicates, missing values, and illegal categories.

`print_categories` prints the categories.

`print` prints the output formatted as required.

###runner.rb
This is a small runner file that creates a CategoryCounter object and calls its `print` method.

##Testing
This project uses minitest for its testing.  To run the tests, call `$ ruby tests.rb`.  The test data is in the test_data directory.
