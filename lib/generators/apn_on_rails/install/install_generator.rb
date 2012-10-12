require 'rails/generators'
require 'rails/generators/migration'

# Generates the migrations necessary for APN on Rails.
# This should be run upon install and upgrade of the
# APN on Rails gem.
#
#   $ rails generate apn:apn_migrations
module ApnOnRails
  module Generators

    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root(File.expand_path(File.join(File.dirname(__FILE__), 'templates')))
      desc "add the migrations"

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end
      
      def create_migrations
        Dir.glob(File.join(self.class.source_root, '*.rb')).sort.each_with_index do |f, i|
          source = File.basename(f)
          source.match(/\d+\_(.+)/)
          destination = "db/migrate/#{$1}"
          migration_template source, destination
        end
      end

    end

  end
end
