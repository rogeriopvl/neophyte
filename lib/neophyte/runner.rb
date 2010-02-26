require 'optparse'

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
      else
        usage
      end
    end
    
    def start
      # start needed stuff
    end
    
    def help
      puts "Help info"
    end
    
    def usage
      puts "Usage: neo <command>"
      puts "Example: neo create myproject"
      puts "Help: neo --help"
    end
    
    protected
  
    def parsed_options?
      opts = OptionParser.new
      opts.on('-v', '--version') { version; exit 0 }
      opts.on('-h', '--help') { help; exit 0 }
      opts.on('-V', '--verbose') { @options.verbose = true }
    end
  
  end
  
end