
module Kernel

  def puts_prompt
    ENV['RUBY_PUTS_PROMPT'] = 'yes'
  end

  def puts_with_prefix(*args)
    if ENV['RUBY_PUTS_PROMPT'] == 'yes'
      prefix = "\e[1;36m>>>\e[0m "
      puts_without_prefix(*(args.collect { |str| "#{prefix}#{str}" }))
    else
      puts_without_prefix(*args)
    end
  end
  alias :puts_without_prefix :puts
  alias :puts :puts_with_prefix

end
