#!/usr/bin/env ruby

class Enhance
  def self.[](obj)
    class << obj
      def heredocify(padding=2)
        self.lines.map.with_index{|l,i|
          next l if i == 0
          l.sub(/^(\s*)/, (' ' * padding) + "\\1")
        }.join
      end
    end
    obj
  end
end

class Tools
  class Tool
    attr_writer :name, :description, :path

    def initialize(path, name='', description='')
      @name = name
      @description = description
      @path = path
    end

    def info
      puts <<-INFO.strip_heredoc
        Name: #{name}
        Path: #{path}
        Description:
          #{description.heredocify}
      INFO
    end

    def name
      @name || 'ERROR: Name not set!'
    end

    def description
      @description || 'ERROR: Description not set!'
    end

    def path
      @path || 'ERROR: Path not set!'
    end
  end
end

# howto:
#
# * read a whole line of user input:
#
#   line = gets
#
# * parse the line of input as if it were a shell:
#
#   Shellwords.shellwords line
#   Shellwords.split line
#
# vim: ft=ruby
