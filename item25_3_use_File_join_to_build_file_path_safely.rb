# File.join
# Take an array of path fragments and return a string file path
# Better than [...].join("/") because it know about edge cases
# Consider Windows, malformed file names, and so on
path_fragments = ["./tmp", "#{rand}", "hello.txt"]
filename = File.join(path_fragments)
p filename
directory = File.dirname(filename)
p directory

Dir.mkdir(directory)
File.open(filename, "w") do |fp|
  fp.write("Hello world")
end
