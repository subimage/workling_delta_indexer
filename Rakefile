require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "workling_delta_indexer"
    gem.summary = %Q{TODO}
    gem.email = "dpickett@enlightsolutions.com"
    gem.homepage = "http://github.com/dpickett/workling_delta_indexer"
    gem.authors = ["Dan Pickett"]
    gem.add_dependency "freelancing-god-thinking-sphinx", ">= 1.1.5"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'workling_delta_indexer'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*', "LICENSE")
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require "YARD"
  YARD::Rake::YardocTask.new do |t|
  end
rescue LoadError

end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test
