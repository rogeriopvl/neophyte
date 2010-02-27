require 'cmdparse'
require 'fileutils'

module Neophyte
  
  class Runner
    
    # for now...
    VALID_TYPES = %w(web)
    VALID_LANGUAGES = %w(html php)
    
    def initialize
      @cmd = CmdParse::CommandParser.new(true, true)
      @cmd.program_name = 'neo '
      @cmd.program_version = VERSION
      
      generate_commands
    end
    
    def start
      @cmd.parse
    end
    
    protected
    
    def generate_commands
      
      create = CmdParse::Command.new('create', false)
      create.short_desc = 'Creates the folders and files for a given project name.'
      create.description = 'This command creates all the folders and files '
      create.description << 'for the given project name. You can specify the '
      create.description << 'project type and main language with the -t '
      create.description << 'and -l switches. By default -t is web and -l is html.'
      
      create.options = CmdParse::OptionParserWrapper.new do |opt|
        opt.on('-t', '--type TYPE',
          'Create project files of type TYPE') { |type| @type = type }
        opt.on('-l', '--language LANGUAGE',
          'Create main project files with the LANGUAGE extension') { |language| @language = language }
      end
      
      create.set_execution_block do |args|
        
        # should this be the desired behavior? Maybe give exit if not valid
        @language = VALID_LANGUAGES[0] unless VALID_LANGUAGES.include?(@language)
        @type = VALID_TYPES[0] unless VALID_TYPES.include?(@type)
        
        puts "Type: #{@type}"
        puts "Main Language: #{@language}"
        self.create
      end
      
      @cmd.add_command(create)
      @cmd.add_command(CmdParse::HelpCommand.new, true)
      @cmd.add_command(CmdParse::VersionCommand.new)
    end
    
    def create
      # TODO
    end
  
  end
  
end