module Neophyte
  
  class Runner
    
    VALID_COMMANDS = %w(help)
    VALID_OPTIONS = %w(--version --web --rubygem)
    
    attr_accessor :command
    attr_accessor :options
    attr_accessor :arguments
    
    def initialize(argv)
      @argv = argv
      parse_command
    end
    
    # parses the input command
    def parse_command
      puts @argv.inspect
    end
    
    def start
      puts "has landed!"
    end
    
  end
  
end