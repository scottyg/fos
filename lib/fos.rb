require "fos/version"

module Fos
  class Action
    def move
      
      # User Variables
      username = File.expand_path('~')
      folder = "archive" # New Folder Name

      #System Paths
      desktop = "#{username}/Desktop"
      downloads = "#{username}/Downloads"
      today = Time.now.strftime("%B %e %Y").gsub(' ', '_').gsub(/:.*/, '')
      
      default_folders = ['Desktop', 'Downloads']
      
      # Do for each folder
      default_folders.each do |this_folder|
        # Get Path
        current_path = "#{username}/#{this_folder}"
          
        # Get Files
        current_files = Dir.entries(current_path)
          
        # Create Folders
        if !File.directory?("#{current_path}/#{folder}")
          `mkdir #{current_path}/#{folder}`
        end
        if !File.directory?("#{current_path}/#{folder}/#{today}")
          `mkdir #{current_path}/#{folder}/#{today}`
        end
          
        #Clean Desktop
        # Remove System Folders And Our New Folder
        current_files.delete_if{|x| (x =~ /^\./) == 0 }
        current_files.delete_if{|x| x == "#{folder}"}
        current_files.delete_if{|x| (x =~ /Macintosh/) == 0}
          
        # Clean File names
        current_files = current_files.map{|x| x.gsub(" ", '\ ').gsub("(", '\(').gsub(")", '\)')}
        # Do The Moving
        current_files.each do |filename|
          `mv #{current_path}/#{filename} #{current_path}/#{folder}/#{today}`
        end
        
        # Finished
        puts "Cleaned #{current_path}"
        
      end
      
    end
  end
end