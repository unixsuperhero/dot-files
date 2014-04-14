#!/Users/MacbookPro/.rbenv/versions/2.0.0-p247/bin/ruby

require 'net/http'

class FourChan
  attr_accessor :thread, :dirname, :body, :pics, :count, :code

  class Interwebs
    def self.download link
      uri = URI(link)
      Net::HTTP.new(uri.host).get(uri.path)
    end
  end

  class Save
    def self.pics pics, debug
      pics.each do |img|
        unless File.exists? img.split('/').last
          printf '-'
          Save.file img.split('/').last, Interwebs.download('http:' + img.sub(/"/,'')).body
        end
        break if debug
      end
    end

    def self.file name, body
      open(name, "wb") { |file| file.write(body) }
    end

    def self.directories dirs
      dirs.each do |dir|
        Dir.mkdir(dir) unless Dir.exists?(dir)
        Dir.chdir dir
      end
      system 'open .'
    end
  end

  def self.gimme moar
    @thread = moar[:thread].match(/\d{5,20}/).to_s
    folder = moar[:dirname] && [moar[:dirname], @thread].join(?-) || @thread
    Save.directories [Dir.pwd, "4chan", moar[:board], folder]
    until @code == '404'
      printf '.'
      page = Interwebs.download(['http://boards.4chan.org', moar[:board], :res, @thread].join('/'))
      @code = page.code
      comments = page.body.scan(/a name="\d{5,20}"[^>]*/).uniq
      pics = page.body.scan(/"\/\/[^"]*\/src\/[^"]*/).uniq
      unless @count == comments.count
        Save.file [Time.now.to_i, '.html'].join, page.body
        printf '_'
      end
      Save.pics pics, moar[:debug]
      @count = comments.count
      sleep 5
    end
    puts '!'
  end
end

url = ARGV[0]
board = url[/\w\w*\/res/].sub(/\/res/, '')
dirname = ARGV[1] || url[/\d\d\d*/]
puts({ url: url, board: board, dirname: dirname })
FourChan.gimme thread: url, dirname: dirname, board: board #, debug: true

