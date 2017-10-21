# File.extname
# Return the extension name for a given filename
# Better than String.split(".").last it knows about weird file paths, and can solve other potential problems with a filename
# Consider a file with no extension: awesome_file
f = File.extname(__FILE__) #__FILE__ indicate to current file
p f

def file_allowed?(filename)
  extension = File.extname(filename)
  [".jpg", ".png", ".bmp"].include?(extension) && File.exists?(filename)
end
p file_allowed?("policy.json")
