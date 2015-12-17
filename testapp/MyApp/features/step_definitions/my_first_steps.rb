require 'byebug'

Given /^I am on the second screen$/ do
  step %{I go to the second screen}
end

Given /^I am on the first screen$/ do
  step %{I go to the first screen}
end

Given /^I am on the third screen$/ do
  step %{I go to the third screen}
end

When /^I go to the second screen$/ do
  TabbarButton.with_accessibility_label('Second').touch
end

When /^I go to the first screen$/ do
  TabbarButton.with_accessibility_label('First').touch
end

When /^I go to the third screen$/ do
  TabbarButton.with_accessibility_label('Third').touch
end


Then /^I should see the second screen's label$/ do
  Label.with_text('Second View').visible?
end

Then /^I should see the first screen's label$/ do
  Label.with_text('First View').visible?
end

When /^I enter my name$/ do
  Textfield.with_accessibility_label('Name_Textfield').enter_text 'Titouan'
end

When /^I show the alert$/ do
  Button.with_accessibility_label('Alert_Button').touch
end

Then /^I should see the alert with my name$/ do
  Alert.with_title_and_msg('Hello', 'Titouan').visible?
end

Then /^I should see the text tableview$/ do
  TableView.with_accessibility_label('Text_TableView').visible?
end

When /^I tap on the cell containing "(.*?)"$/ do |text|
  text_label = Label.with_text text
  cell = TableView.with_accessibility_label('Text_TableView').table_view_cell.with_descendants [text_label]
  cell.touch
end

Then /^the cell containing "(.*?)" should be selected$/ do |text|
  text_label = Label.with_text text
  cell = TableView.with_accessibility_label('Text_TableView').table_view_cell.with_descendants [text_label]
  cell.selected?
end
