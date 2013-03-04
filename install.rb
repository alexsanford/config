#!/usr/bin/env ruby

$mydir = File.expand_path(File.dirname(__FILE__))
$files = %w{zshrc zsh_aliases zshenv vimrc gvimrc vim tmux.conf gitconfig ruby railsrc}
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

# Color setup
puts 'Make sure to set up the correct color reporting in the terminal!'
puts '  May need to change the command to `env TERM=xterm-256color /bin/zsh`'
