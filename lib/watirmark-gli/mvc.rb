module WatirmarkGli
  # Create new MVC project
  class MVC
    def self.initialize(file_name)
      file_name = file_name.capitalize
      file_relative_path = File.dirname(__FILE__)
      current_directory = Dir.pwd
      @relative_path = "#{current_directory}/#{file_name}"
      puts @relative_path
      @templates_path = "#{file_relative_path}/templates/generators/mvc/templates"
    end


    def self.generate_controller_rb(controller_name)
      file_name_erb = "#{@templates_path}/features/env.rb.erb"
      file_name = "#{@relative_path}/features/env.rb"
      Project.process_erb_file(file_name_erb, file_name)
    end

    def self.generate_model_rb(model_name)
      file_name_erb = "#{@templates_path}/features/env.rb.erb"
      file_name = "#{@relative_path}/features/env.rb"
      Project.process_erb_file(file_name_erb, file_name)
    end

    def self.generate_view_rb(view_name)
      file_name_erb = "#{@templates_path}/features/env.rb.erb"
      file_name = "#{@relative_path}/features/env.rb"
      Project.process_erb_file(file_name_erb, file_name)
    end

    def self.new(directory_name,controller_name,model_name,view_name)
      initialize(directory_name)
      Project.create_directory(@relative_path)
    end
  end
end
