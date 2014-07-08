#!/usr/bin/ruby
require 'yaml'

dates = {}
last_date = nil
last_email = nil

totals = {}
temp_totals = {}
include_totals = false
total_date = nil

while(! $stdin.eof)
  li = $stdin.readline
  if li.index(/!/)
    _,date,em = li.split(/\s+/)
    #dates[em] = { date => nil } if dates[em] == nil
    #dates[em][date] = {'ins' => 0, 'del' => 0 } if dates[em][date] == nil
    dates.merge!( date => dates.fetch(date, {}) )
    dates[date].merge!( em => dates[date].fetch(em, {'ins' => 0, 'del' => 0}) )
    last_date = date
    last_email = em
  else
    while(li =~ /([0-9]+) (ins|del)(.*)/)
      # puts "Current #{$2}: #{$1}"
      dates[last_date][last_email][$2] += $1.to_i
      temp_email = totals.fetch(last_email, {'ins' => 0, 'del' => 0})
      temp_email[$2] += $1.to_i
      totals.merge!(last_email => temp_email)
      li = $3
    end
  end
end

puts "[ TOTALS ]"
totals.each do |dev,vals|
  printf "  %-30s %4s+ %4s-\n", dev, vals['ins'], vals['del']
end
puts

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
  puts
end
