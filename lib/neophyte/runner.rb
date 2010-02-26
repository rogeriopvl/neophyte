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
      if @argv.length == 1
        if @argv[0] == 'help'
          help
        end
      end
    end
    
    def start
      # start needed stuff
    end
    
    def help
      puts "Help info"
    end
    
  end
  
end