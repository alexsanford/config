#!/usr/bin/env ruby

$mydir = File.expand_path(File.dirname(__FILE__))
$files = %w{zshrc zsh_aliases zshenv}
$extensions = %w{osx linux}

def link(file)
  filepath = File.join($mydir, file)
  if File.exist?(filepath)
    home_file = `echo $HOME/.#{file}`
    puts "hf: #{home_file}"
    puts "exists?: #{File.exist?(home_file)}"
    if File.exist?(home_file)
      puts "Not overwriting #{home_file}"
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
