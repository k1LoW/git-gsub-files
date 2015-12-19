require 'rspec'
require 'tmpdir'
require 'git/gsub/files'

describe 'git-gsub-files' do
  def run_in_directory_with_a_file(filename)
    Dir.mktmpdir do |dir|
      Dir.chdir dir do
        File.open(filename, 'w') { |f| f << 'Hello Git!' }
        `git init`
        `git config --local user.email "you@example.com"`
        `git config --local user.name "Your Name"`
        `git add .`
        `git commit -m init`
        yield filename
      end
    end
  end

  it 'should mv files' do
    run_in_directory_with_a_file('README.md') do
      Git::Gsub::Files.gsub_files('mv', 'READ', 'WRITE')
      expect(`ls`).to eql "WRITEME.md\n"
    end
  end

  it 'should git mv files' do
    run_in_directory_with_a_file('README.md') do
      Git::Gsub::Files.gsub_files('git mv', 'READ', 'WRITE')
      expect(`ls`).to eql "WRITEME.md\n"
    end
  end
end
