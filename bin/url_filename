#!/usr/bin/ruby

require 'uri'
extend URI::Escape

url = ARGV[0].dup unless ARGV[0] == nil
url ||= `pbpaste`

url.gsub!(/[?].*/,'')
url.gsub!(/.*[\/]/, '')
puts decode(url)

__END__

require 'yaml'

puts [

  'URL BEFORE:',
    url,

  'URL AFTER:',
    url_after = url.gsub(/[?].*|.*[\/]/, ''),

  'URL DECODED:',
    decode(url_after),

].to_yaml

