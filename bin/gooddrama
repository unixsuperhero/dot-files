#!/Users/MacbookPro/.rbenv/versions/2.0.0-p247/bin/ruby

require 'uri'
require 'net/http'
require 'pp'

class GoodDrama
  attr_accessor :uri, :parts, :embeds, :files
  attr_accessor :response, :body, :part, :mirror

  def initialize(uri, part=1, mirror=1)
    @uri = URI(uri)
    @part = part
    @mirror = mirror.to_i
    @embeds = []
    @files = []
  end

  def response
    @response ||= Net::HTTP.get_response(uri)
  end

  def body
    #@body = IO.read('test.html')
    @body ||= response.body
  end

  def parts_regex
    /href=['"]([^"']*\/#{mirror}-(\d\d*))["'][^>]*>part\s*\d\d*/i
  end

  def parts
    @parts ||= [[uri,'1']] + body.scan(parts_regex)
  end

  def embed_regex
    /https?:..[^'"]*embed.php[^'"]*/i
  end

  def embed
    @embed ||= body.scan(file_regex).grep(/mp4|flv/i).first(mirror).last
  end

  def file_regex
    /https?:..[^'"]*part.#{part}[^'"]*/i
  end

  def file
    uri = URI(embed)
    r = Net::HTTP.get_response(uri)
    URI.decode r.body.scan(file_regex).first.to_s
  end

  def embeds
    parts.map do |url,part|
      (url == @url) ? embed : GoodDrama.new(url,part,mirror).embed
    end
  end

  def files
    parts.map do |url,part|
      (url == @url) ? file : GoodDrama.new(url,part,mirror).file
    end
  end
end

wgets = []
GoodDrama.new(ARGV[0], 1, ARGV[1] || 1).files.each do |file|
  wgets.push "wget -cb '#{file}'"
  # `open '#{file}'` unless !!ARGV[2]
end

puts wgets

