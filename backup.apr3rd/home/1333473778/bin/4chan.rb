#!/Users/jtoyota/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

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
          Save.file img.split('/').last, Interwebs.download(img).body
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
    Save.directories ["/Users/jtoyota/jearsh/pictures", "4chan", moar[:dirname] || @thread]
    until @code == '404'
      printf '.'
      page = Interwebs.download(['http://boards.4chan.org', :b, :res, @thread].join('/'))
      @code = page.code
      comments = page.body.scan(/a name="\d{5,20}"[^>]*/).uniq
      pics = page.body.scan(/https?:..images.4chan.org[^"]*/).uniq
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

FourChan.gimme thread: ARGV[0], dirname: ARGV[1], debug: true

