# File.open
# Has two forms:
# File.open(filename, mode) # return file pointer
# File.open(filename, mode) {|file_pointer| ...}
# Block form flushes and closes the file as soon as the block returns
f = File.open("./tmp/file.txt", "w")
f.write("bees")
f = nil
f = File.open("./tmp/file.txt", "r")
p f.read

File.open("./tmp/file2.txt", "w") do |fp|
  fp.write("bees")
end

f = File.open("./tmp/file2.txt")
p f.read

File.open("./tmp/file2.txt", "r") do |fp|
  p fp.read
end
