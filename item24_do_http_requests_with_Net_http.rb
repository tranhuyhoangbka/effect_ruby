# Net::HTTP
# Ruby's build-in HTTP library
# Can make http,https requests
# there are many gems, but Net::HTTP is the most 
# performace way to make http requests
require "net/http"
#res = Net::HTTP.get("httpbin.org", "/user-agent")
uri = URI("http://httpbin.org/user-agent")
res = Net::HTTP.get(uri)
# puts res.body
# p res.code
puts res
p "----------------------"

uri = URI("http://httpbin.org/post")
res = Net::HTTP.post_form(uri, q: 'ruby')
puts res.body
p res.code

Net::HTTP.start("httpbin.org", 80) do |http|
  request = Net::HTTP::Get.new(URI("http://httpbin.org/user-agent"))
  res = http.request(request)
  p res.code
  puts res.body
end
