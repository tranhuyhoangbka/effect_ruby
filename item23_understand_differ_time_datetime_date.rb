# Time, DateTime, Date
# All represent times to varying degrees of precisio
# Date represents an individual day
# DateTime give time to second, represents individual calendar components internally, and is implemented in ruby
# Time gives time to high precision, does not represents calendar components, and is implemented in C
# Time represents leap seconds, DateTime does not
# Time represents daylight saving time, DateTime does not
require "date"
dt = DateTime.now
#<DateTime: 2017-10-22T00:41:01+07:00 ((2458048j,63661s,329047133n),+25200s,2299161j)>
t = Time.now
# 2017-10-22 00:41:05 +0700
d = Date.today
#<Date: 2017-10-22 ((2458049j,0s,0n),+0s,2299161j)>

d.to_s #=> "2017-10-22"
dt.to_s #=> "2017-10-22T00:41:01+07:00"
t.to_s #=>  "2017-10-22 00:43:46 +0700"

d = Date.new(2015, 04, 03)
# => #<Date: 2015-04-03 ((2457116j,0s,0n),+0s,2299161j)>

dt.zone # => "+07:00" 
t.zone # => "ICT"
