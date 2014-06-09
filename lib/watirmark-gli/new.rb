# http://stackoverflow.com/questions/980547/how-do-i-execute-ruby-template-files-erb-without-a-web-server-from-command-lin
# http://ruby-doc.org/stdlib-2.1.2/libdoc/erb/rdoc/ERB.html
# http://ruby-doc.org/stdlib-1.9.3/libdoc/fileutils/rdoc/FileUtils.html
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
    # https://www.ruby-forum.com/topic/4411006
    def self.camelize(string_input)
      string_input.split('_').each { |s| s.capitalize! }.join('')
    end

    def self.create_directory(directory_path)
      if Dir.exists? directory_path
        puts "Directory already exist at path:'#{directory_path}'"
      else
        FileUtils.mkdir_p directory_path
      end
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

    def self.generate_env_rb
      file_name_erb = "#{@templates_path}/features/env.rb.erb"
      file_name = "#{@relative_path}/features/env.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_model_steps_rb
      file_name_erb = "#{@templates_path}/features/model_steps.rb.erb"
      file_name = "#{@relative_path}/features/model_steps.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_post_error_steps_rb
      file_name_erb = "#{@templates_path}/features/post_error_steps.rb.erb"
      file_name = "#{@relative_path}/features/post_error_steps.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_sample_feature
      file_name_erb = "#{@templates_path}/features/sample.feature.erb"
      file_name = "#{@relative_path}/features/sample.feature"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_site_steps_rb
      file_name_erb = "#{@templates_path}/features/site_steps.rb.erb"
      file_name = "#{@relative_path}/features/site_steps.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.create_features_directory
      features_directory_path = "#{@relative_path}/features"
      create_directory(features_directory_path)
      generate_env_rb
      generate_model_steps_rb
      generate_post_error_steps_rb
      generate_sample_feature
      generate_site_steps_rb
    end

    def self.create_mvc_directory
      mvc_directory_path = "#{@relative_path}/generators/mvc"
      create_directory(mvc_directory_path)
    end

    def self.create_generators_directory
      generators_directory_path = "#{@relative_path}/generators"
      create_directory(generators_directory_path)
      create_mvc_directory
    end

    def self.generate_page_load_checker_rb
      file_name_erb = "#{@templates_path}/lib/name/checkers/page_load_checker.rb.erb"
      file_name = "#{@relative_path}/lib/name/checkers/page_load_checker.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_post_errors_checker_rb
      file_name_erb = "#{@templates_path}/lib/name/checkers/post_errors_checker.rb.erb"
      file_name = "#{@relative_path}/lib/name/checkers/post_errors_checker.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.create_checkers_directory
      checkers_directory_path = "#{@relative_path}/lib/name/checkers"
      create_directory(checkers_directory_path)
      generate_page_load_checker_rb
      generate_post_errors_checker_rb
    end

    def self.generate_base_controller_rb
      file_name_erb = "#{@templates_path}/lib/name/site/base_controller.rb.erb"
      file_name = "#{@relative_path}/lib/name/site/base_controller.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_base_view_rb
      file_name_erb = "#{@templates_path}/lib/name/site/base_view.rb.erb"
      file_name = "#{@relative_path}/lib/name/site/base_view.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_search_controller_rb
      file_name_erb = "#{@templates_path}/lib/name/site/search_controller.rb.erb"
      file_name = "#{@relative_path}/lib/name/site/search_controller.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.create_site_directory
      site_directory_path = "#{@relative_path}/lib/name/site"
      create_directory(site_directory_path)
      generate_base_controller_rb
      generate_base_view_rb
      generate_search_controller_rb
    end

    def self.create_name_directory
      name_directory_path = "#{@relative_path}/lib/name"
      create_directory(name_directory_path)
      create_checkers_directory
      create_site_directory
    end

    def self.create_lib_directory
      lib_directory_path = "#{@relative_path}/lib"
      create_directory(lib_directory_path)
      create_name_directory
    end

    def self.generate_generate_rb
      file_name_erb = "#{@templates_path}/script/generate.rb.erb"
      file_name = "#{@relative_path}/script/generate.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.create_script_directory
      script_directory_path = "#{@relative_path}/script"
      create_directory(script_directory_path)
      generate_generate_rb
    end

    def self.generate_erb_config_yml
      file_name_erb = "#{@templates_path}/config.yml.erb"
      file_name = "#{@relative_path}/config.yml"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_gemfile_rb
      file_name_erb = "#{@templates_path}/gemfile.rb.erb"
      file_name = "#{@relative_path}/gemfile.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.generate_rakefile_rb
      file_name_erb = "#{@templates_path}/rakefile.rb.erb"
      file_name = "#{@relative_path}/rakefile.rb"
      process_erb_file(file_name_erb, file_name)
    end

    def self.new(file_name)
      initialize(file_name)
      create_directory(@relative_path)
      create_features_directory
      create_generators_directory
      create_lib_directory
      create_script_directory
      generate_erb_config_yml
      generate_gemfile_rb
      generate_rakefile_rb
    end
  end
end
