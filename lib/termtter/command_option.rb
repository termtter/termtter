# -*- coding: utf-8 -*-

require "strscan"

module Termtter
  class CommandOption
    attr_reader :options

    def initialize(input)
      @command_line = input
      @options = parse
    end

    def parse
      r = {}
      case @command_line[0]
      when '/'
        r = parse_command
      when '$'
        p "repluy"
        r = parse_reply
      else
        p "update"
        r[:command] = "update"
        r[:args] = @command_line
      end
      p r
      r
    end
    
    def parse_command
      r = {}
      s = StringScanner.new(@command_line)
      s.scan(/\/(\w+)(\s*)/)
      r[:command] = s[1]
      r[:args] = s.post_match
      r
    end
    
    def parse_reply
      r = {}
      r[:command] = "reply"
      r[:args] = @command_line
      r
    end
  end
end
