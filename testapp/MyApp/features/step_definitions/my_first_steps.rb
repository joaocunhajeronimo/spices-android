require 'byebug'

When /^I go to the second screen$/ do
  TabbarButton.with_accessibility_label('Second').touch
end

When /^I go to the first screen$/ do
  TabbarButton.with_accessibility_label('First').touch
end

Then /^I should see the second screen's label$/ do
  Label.with_text('Second View').displayed?
end

Then /^I should see the first screen's label$/ do
  Label.with_text('First View').displayed?
end
