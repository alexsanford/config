
module Kernel

  def puts_with_prefix(*args)
    prefix = "\e[1;36m>>>\e[0m "
    puts_without_prefix(args.collect { |str| "#{prefix}#{str}" })
  end
  alias :puts_without_prefix :puts
  alias :puts :puts_with_prefix

end
