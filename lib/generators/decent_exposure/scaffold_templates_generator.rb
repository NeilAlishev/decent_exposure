require 'rails/generators'

module DecentExposure
  module Generators
    class ScaffoldTemplatesGenerator < Rails::Generators::Base
      desc 'Generate DecentExposure scaffold template files'
      source_root File.expand_path('../templates', __FILE__)
      class_option :template_engine, desc: 'Template engine to be invoked (erb).'

      VIEWS = %i(_form edit index new show)

      def generate
        generate_controller
        VIEWS.each { |view| generate_view(view) }
      end

      private

      def generate_controller
        copy_template('rails/scaffold_controller', 'controller.rb')
      end

      def generate_view(view)
        copy_template("#{engine}/scaffold", "#{view}.html.#{engine}")
      end

      def copy_template(generator, file)
        copy_file(file, "lib/templates/#{generator}/#{file}")
      end

      def engine
        options[:template_engine]
      end
    end
  end
end
