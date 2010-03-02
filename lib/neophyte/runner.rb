require 'cmdparse'
require 'yaml'
require 'fileutils'

module Neophyte
  
  class Runner
    
    # for now...
    VALID_TYPES = %w(web)
    VALID_LANGUAGES = %w(html php)
    VALID_DOCTYPES = %w(xhtml10strict xhtml10trans html5 html4strict html4trans)
    
    def initialize
      @cmd = CmdParse::CommandParser.new(true, true)
      @cmd.program_name = 'neo '
      @cmd.program_version = VERSION
      
      generate_commands
    end

    # start the argument parsing
    
    def start
      @cmd.parse
    end
    
    protected
    
    # generates all available commands with CmdParse
    
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
          'Create main project files with the LANGUAGE extension'
          ) { |language| @language = language }
        opt.on('-d', '--doctype DOCTYPE',
          'Create main project markup files with chosen DOCTYPE. Only for web projects'
          ) { |doctype| @doctype = doctype }
      end
      
      create.set_execution_block do |args|
        
        # should this be the desired behavior? Maybe exit if not valid
        @language = VALID_LANGUAGES[0] unless VALID_LANGUAGES.include?(@language)
        @type = VALID_TYPES[0] unless VALID_TYPES.include?(@type)
        @doctype = VALID_DOCTYPES[0] unless VALID_DOCTYPES.include?(@doctype)
        
        puts "Type: #{@type}"
        puts "Main Language: #{@language}"
        self.create(args[0])
      end
      
      @cmd.add_command(create)
      @cmd.add_command(CmdParse::HelpCommand.new, true)
      @cmd.add_command(CmdParse::VersionCommand.new)
    end
    
    # creates the project directory structure
    
    def create(project_name)
      project = read_config_file()
      FileUtils.mkdir(project_name)
      project['project']['folders'].each do |folder|
        FileUtils.mkdir_p("#{project_name}/#{folder['name']}")
        f['files'].each do ||
      end
      
    end
    
    private 
    
    # reads the yaml config file and returns
    # the yaml object.
    
    def read_config_file
      config_path = File.expand_path(File.dirname(__FILE__)+"/../../")
      YAML.load_file("#{config_path}/config/#{@type}/config.yaml")
    end
  
  end
  
end