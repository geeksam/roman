begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--order defined --fail-fast --color'
    t.verbose = false
  end
  task :default => :spec
rescue LoadError
end
