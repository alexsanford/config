#!/usr/bin/env ruby

$mydir = File.expand_path(File.dirname(__FILE__))
$files = %w{zshrc zsh_aliases zshenv}
$extensions = %w{osx linux}

def link(file)
  filepath = File.join($mydir, file)
  if File.exist?(filepath)
    home_file = File.join(Dir::home, ".#{file}")
    if File.exist?(home_file)
      unless File.realpath(home_file) == File.realpath(filepath)
        puts "WARNING: Not overwriting #{home_file}"
      end
    else
      `ln -s #{filepath} #{home_file}`
    end
  end
end

# Main
$files.each do |file|
  all_ext = [ '' ] + $extensions.collect { |e| ".#{e}" }
  all_ext.each do |ext|
    link file + ext
  end
end
