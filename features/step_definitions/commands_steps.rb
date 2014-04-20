When(/^I run maule with 'environments'$/) do
  command = File.expand_path(File.dirname(__FILE__)+ '/../../_build/maule')
  step("I run `#{command} environments`")
end

Then(/^the output should contain$/) do |string|
  step("the output should contain \"#{string}\"")
end