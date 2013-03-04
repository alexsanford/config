remove_file 'README.rdoc'
create_file 'README.md', 'TODO'

# Helpers

def use?(gem)
  @gems ||= {}
  if @gems[gem] == nil
    @gems[gem] = yes?("Use #{gem}?")
  end
  @gems[gem]
end

def method_missing(meth, *args, &block)
  if meth =~ /use_(.+)\?/
    use?($1)
  else
    super
  end
end

# Gems to use for sure

gem 'haml'
gem 'bson_ext'
gem 'mongoid', '~> 2.4.12'

gem 'rspec-rails', '~> 2.0', group: [:test, :development]
gem 'factory_girl'
gem 'mocha', require: false

%w{devise capistrano unicorn}.each do |gem_name|
  gem gem_name if use?(gem_name)
end

run 'bundle install'

generate 'mongoid:config'
generate 'rspec:install'

if use_devise?
  generate 'devise_install'
  model = ask('Devise model (or blank to do it manually):')
  generate 'devise', 'model' unless model.blank?
end

if use_capistrano?
  run 'capify .'
end

git :init
git add: '.', commit: '-m "Initial commit"'
