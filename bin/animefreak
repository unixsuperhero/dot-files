#!/Users/MacbookPro/.rbenv/versions/2.0.0-p247/bin/ruby

require 'uri'
require 'net/http'
require 'pp'

class AnimeFreak
  attr_accessor :url

  def sample_file
    'sample.html'
  end

  def sample_exists?
    Dir.glob(sample_file).any?
  end

  def initialize(url)
    @url = url.gsub(/\s/, '%20')
  end

  def uri
    @uri ||= URI(url)
  end

  def response
    pp "Downloading '#{url}'..."
    @response ||= Net::HTTP.get_response(uri)
  end

  def body
    @body ||= response.body
  end

  def self.file(link)
    response = Net::HTTP.get_response(URI(link.gsub(/\s/, '%20')))
    body = response.body
    files = body.scan(/file=(http[^'"<>]*)/i).flatten
    files.map{|m| URI.decode(m).gsub(/[+]/, ' ') }.uniq
  end

  def mirror_regex
    /(https?:..[^'"<>]*?(?:flv|mp4|embed)[^'"<>]*)/i
  end

  def mirrors
    URI.decode(body).scan(mirror_regex).flatten.map do |m|
      m.gsub(/[+]/, ' ')
    end
  end

  def targetted_mirrors
    mirrors = body.scan(/coz\("(http[^"]*)"/i) + body.scan(/javascript.loadparts..([^']*)'/i)

    mirrors.flatten.map{|m|
      URI.decode(m).scan(/https?:..[^'"<>]*/i)
    }.flatten.map{|m|
      m.gsub(/[+]/, ' ')
    }
  end
end

link = ARGV[0]
anime = AnimeFreak.new(link)

puts anime.mirrors.map{|mirror|
  if mirror =~ /\/[^\/]*[.](flv|mp4)([?]|$)/i
    '( cd ~/Downloads; wget -cb "%s" )' % mirror
  elsif (file = AnimeFreak.file(mirror)).any?
    file.map{|m| '( cd ~/Downloads; wget -cb "%s" )' % m }
  else
    "# REQUIRES MORE PROCESSING '%s'" % mirror
  end
}.flatten.group_by{|l|
  l =~ /REQUIRES MORE PROCESSING/
}.values.map{|g| g.join("\n") }.join("\n\n")

