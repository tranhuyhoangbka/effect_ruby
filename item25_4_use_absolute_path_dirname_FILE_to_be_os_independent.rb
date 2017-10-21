# Finding yourself
# Can sometimes be useful to know what directory the current file is on the system
# __FILE__ return the current file path
# dirname takes a file name and returns directory name
# absolute_path joins the current working directory on to relative paths
require "./new_file"
this_file = __FILE__
p this_file
p File.absolute_path(__FILE__)
p File.dirname(File.absolute_path(__FILE__))
p Foo.new
