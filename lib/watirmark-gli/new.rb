require 'fileutils'
module WatirmarkGli
  # Create new WatirmarkGli project
  class Project
    def self.initialize(file_name)
      file_relative_path = File.dirname(__FILE__)
      @relative_path = "#{file_relative_path}/#{file_name}"
    end

    def self.new(file_name)
      initialize(file_name)
      create_directory(@relative_path)
    end

    def self.create_directory(directory_path)
      FileUtils.mkdir_p directory_path
    end
  end
end
