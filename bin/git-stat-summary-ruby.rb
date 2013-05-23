#!/usr/bin/ruby
require 'yaml'

dates = {}
last_date = nil
last_email = nil

while(! $stdin.eof)
  li = $stdin.readline
  if li.index(/!/)
    _,date,em = li.split(/\s+/)
    dates[em] = { date => nil } if dates[em] == nil
    dates[em][date] = {'ins' => 0, 'del' => 0 } if dates[em][date] == nil
    last_date = date
    last_email = em
  else
    while(li =~ /([0-9]+) (ins|del)(.*)/)
      dates[last_email][last_date][$2] += $1.to_i
      li = $3
    end
  end
end

dates.each do |date,dev|
  puts "[ #{date} ]\n"
  dev.each do |em,cnts|
    counts = [em]
    cnts.each do |t,n|
      indx = t == 'ins' && 1 || 2
      counts[indx] = n
    end
    printf "  %-30s %4s+ %4s-\n", *counts
  end
end
