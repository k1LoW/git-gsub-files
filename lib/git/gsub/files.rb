require 'git/gsub/files/version'
require 'shellwords'

module Git
  module Gsub
    module Files
      def self.run
        case ARGV.first
        when '-v', '--version'
          version
        else
          gsub_files(*ARGV)
        end
      end

      def self.version
        puts Git::Gsub::VERSION
      end

      def self.gsub_files(*args)
        from, to, path, = args.map do |arg|
          Shellwords.escape arg if arg
        end

        abort 'No argument to gsub-files was given' if to.nil?

        (`git ls-files #{path}`).each_line.map(&:chomp).map do |file|
          next unless File.basename(file).match(from)
          to_file = File.dirname(file) + '/' + File.basename(file).gsub(from, to)
          system %|mv -v #{file} #{to_file}|
        end
      end
    end
  end
end
