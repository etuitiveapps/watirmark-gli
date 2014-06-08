require 'fileutils'
require 'erb'
module WatirmarkGli
  # Create new WatirmarkGli project
  class Project
    def self.initialize(file_name)
      file_relative_path = File.dirname(__FILE__)
      @relative_path = "#{file_relative_path}/#{file_name}"
      @templates_path = "#{file_relative_path}/templates"
    end

    def self.new(file_name)
      initialize(file_name)
      create_directory(@relative_path)
      erb_config_yml
    end

    def self.create_directory(directory_path)
      if Dir.exists? directory_path
        puts "Directory already exist at path:'#{directory_path}'"
      else
        FileUtils.mkdir_p directory_path
      end
    end

    def self.erb_config_yml
      file_name_erb = "#{@templates_path}/config.yml.erb"
      file_name = "#{@relative_path}/config.yml"
      process_erb_file(file_name_erb, file_name)
    end

    def self.process_erb_file(file_name_erb, file_name)
      if File.exist?(file_name)
        puts "File already exist at path:'#{file_name}'"
      else
        template_file = File.open(file_name_erb, 'r').read
        erb = ERB.new(template_file)
        File.open(file_name, 'w+') { |file| file.write(erb.result(binding)) }
      end
    end
  end
end
