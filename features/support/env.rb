require 'aruba/cucumber'

Before do
  @original_home = ENV['HOME']
  home = File.expand_path(File.dirname(__FILE__)+ '/../../tmp/fake_home')
  ENV['HOME'] = home
  FileUtils.rm_rf home
  FileUtils.mkdir home
end

After do
  ENV['HOME']    = @original_home
end
