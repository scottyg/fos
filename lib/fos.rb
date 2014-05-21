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

      # Get Files
      desktop_files = Dir.entries(desktop)
      download_files = Dir.entries(downloads)

      # Create Folders
      if !File.directory?("#{desktop}/#{folder}")
        `mkdir #{desktop}/#{folder}`
      end
      if !File.directory?("#{desktop}/#{folder}/#{today}")
        `mkdir #{desktop}/#{folder}/#{today}`
      end
      if !File.directory?("#{downloads}/#{folder}")
        `mkdir #{downloads}/#{folder}`
      end
      if !File.directory?("#{downloads}/#{folder}/#{today}")
        `mkdir #{downloads}/#{folder}/#{today}`
      end

      #Clean Desktop
      # Remove System Folders And Our New Folder
      desktop_files.delete_if{|x| (x =~ /^\./) == 0 }
      desktop_files.delete_if{|x| x == "#{folder}"}
      desktop_files.delete_if{|x| (x =~ /Macintosh/) == 0}

      # Clean File names
      desktop_files = desktop_files.map{|x| x.gsub(" ", '\ ').gsub("(", '\(').gsub(")", '\)')}

      # Do The Moving
      desktop_files.each do |filename|
        `mv #{desktop}/#{filename} #{desktop}/#{folder}/#{today}`
      end

      #Clean Downloads
      # Remove System Folders And Our New Folder
      download_files.delete_if{|x| (x =~ /^\./) == 0 }
      download_files.delete_if{|x| x == "#{folder}"}
      download_files.delete_if{|x| (x =~ /Macintosh/) == 0}

      # Clean File names
      download_files = download_files.map{|x| x.gsub(" ", '\ ').gsub("(", '\(').gsub(")", '\)')}

      # Do The Moving
      download_files.each do |filename|
        `mv #{downloads}/#{filename} #{downloads}/#{folder}/#{today}`
      end
      
    end
  end
end
