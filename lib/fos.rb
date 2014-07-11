# Full Of Shit
require "fos/version"
require 'optparse'
require 'colorize'
require 'yaml'

module Fos
  
  class Action
    def archive
     
      options = {}
      
      # Option parser 'optparse'
      opt_parser = OptionParser.new do |opt|
        opt.banner = "Fos is a folder archive tool for Linux or Mac."
        opt.separator  ""
        opt.separator  "Archives ~/Desktop and ~/Downloads by default"
        opt.separator  ""
        opt.separator  "Usage: fos [OPTIONS]"
        opt.separator  ""
        opt.separator  "Options"
        opt.on("-p","--path PATH","Input path(s), BE CAREFUL WITH THIS") do |path|
          options[:path] = path
        end
        opt.on("-n","--name NAME","Output name, default is archive") do |name|
          options[:name] = name
        end
        opt.on("-z","--zip","Output as zip file, default is false") do |zip|
          options[:zip] = zip
        end
        opt.on("-h","--help","help") do |help|
          puts opt_parser
          options[:help] = help
        end
        opt.on("-v","--version","version") do |version|
          puts Fos::VERSION
          options[:version] = version
        end
      end

      begin opt_parser.parse! ARGV
      rescue OptionParser::InvalidOption => e
        puts e
        puts "Try fos -h"
        exit 1
      end
      
      user_path = File.expand_path('~')
      
      # Config file
      if !File.directory?("#{user_path}/.fos")
        `mkdir #{user_path}/.fos`
        `touch #{user_path}/.fos/config.yml`
        open("#{user_path}/.fos/config.yml", 'w') { |f|
          f.puts "name: archive"
          f.puts "paths: [#{user_path}/Desktop, #{user_path}/Downloads]"
        }
      end
      
      hash = YAML.load(File.read("#{user_path}/.fos/config.yml"))
      
      # Option variables
      path = options[:path] || nil
      archive_name = options[:name] || hash['name']
      zip = options[:zip] || false
      version = options[:version] || false
      help = options[:help] || false
	  
      folders = hash['paths']
      today = Time.now.strftime("%B %e %Y").gsub(' ', '_').gsub(/:.*/, '')
            
      # Look for commands
      case ARGV[0]
      when "shit"
        puts "I can clean that up for you"
      else
         do_archive = true
      end
      
      # Check if help or version option, Disable archive
      if help == true || version == true
        do_archive = false
      end
      
      # Set new path if option is set
      if !path.nil?
      	folders = path.split(',')
        folders.each do |f|
          f.sub! "~", "#{user_path}"
        end
      end
      
      if do_archive == true
        # Do for each folder
        folders.each do |current_path|
        
          # Get files
          current_files = Dir.entries(current_path)
        
          # Create folders
          if !File.directory?("#{current_path}/#{archive_name}")
            `mkdir #{current_path}/#{archive_name}`
            puts "[ " + "Creating".yellow + ": "+"#{current_path}/#{archive_name}"+" ]"
          end
          if !File.directory?("#{current_path}/#{archive_name}/#{today}")
            `mkdir #{current_path}/#{archive_name}/#{today}`
            puts "[ " + "Creating".yellow + ": "+"#{current_path}/#{archive_name}/#{today}"+" ]"
          end
        
          # Remove system folders and our new folder
          current_files.delete_if{|x| (x =~ /^\./) == 0 }
          current_files.delete_if{|x| x == "#{archive_name}"}
          current_files.delete_if{|x| (x =~ /Macintosh/) == 0}
          
          # Clean file names
          current_files = current_files.map{|x| x.gsub(" ", '\ ').gsub("(", '\(').gsub(")", '\)')}
        
          # Do the moving
          current_files.each do |filename|
            `mv #{current_path}/#{filename} #{current_path}/#{archive_name}/#{today}`
            puts "[ " + "Archiving".yellow + ": "+"#{current_path}/#{filename}"+" ]"
          end
        
          # Do zip if option is set
          if zip == true
            puts "[ " + "Zipping".yellow + ": #{current_path} ]"
            `zip -r #{current_path}/#{archive_name}.zip #{current_path}/#{archive_name}`
            # Add extension name for finishing message
            tmp_archive_name = archive_name + ".zip"
          else
            tmp_archive_name = archive_name
          end
          
          # Finished
          puts "[ " + "Archived".colorize(:green) + ": "+"#{current_path} "+"into"+" #{current_path}/#{tmp_archive_name}"+" ]"
          
        end
      end
    end
  end
end