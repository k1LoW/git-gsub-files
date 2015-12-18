require 'git/gsub/files/version'
require 'shellwords'
require 'optparse'

module Git
  module Gsub
    module Files
      def self.run
        params = ARGV.getopts('av', 'add', 'version')
        if params['v'] || params['version']
          version
        else
          command = 'mv'
          command = 'git mv' if params['a'] || params['add']
          gsub_files(command, *ARGV)
        end
      end

      def self.version
        puts Git::Gsub::Files::VERSION
      end

      def self.gsub_files(command, *args)
        from, to, path, = args.map do |arg|
          Shellwords.escape arg if arg
        end

        abort 'No argument to gsub-files was given' if to.nil?

        (`git ls-files #{path}`).each_line.map(&:chomp).map do |file|
          next unless File.basename(file).match(from)
          to_file = File.dirname(file) + '/' + File.basename(file).gsub(from, to)
          system %|#{command} -v #{file} #{to_file}|
        end
      end
    end
  end
end
