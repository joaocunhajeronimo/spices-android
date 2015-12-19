Gem::Specification.new do |s|
  s.name        = 'spices'
  s.version     = '0.0.1'
  s.date        = '2015-12-28'
  s.summary     = "Software layer between Calabash and Cucumber"
  s.description = "A gem that makes the use of Calabash way simpler and straightforward"
  s.authors     = ["Titouan Van Belle"]
  s.email       = 'titouan.vanbelle@gmail.com'
  s.files       = [
    "lib/spices/base/base_component.rb",
    "lib/spices/base/base_screen.rb",
    "lib/spices/components/alert.rb",
    "lib/spices/components/button.rb",
    "lib/spices/components/progress_view.rb",
    "lib/spices/components/image_view.rb",
    "lib/spices/components/activity_indicator_view.rb",
    "lib/spices/components/stepper.rb",
    "lib/spices/components/slider.rb",
    "lib/spices/components/segmented_control.rb",
    "lib/spices/components/segment.rb",
    "lib/spices/components/label.rb",
    "lib/spices/components/navigation_bar.rb",
    "lib/spices/components/switch.rb",
    "lib/spices/components/tab_bar_button.rb",
    "lib/spices/components/tab_bar.rb",
    "lib/spices/components/search_bar.rb",
    "lib/spices/components/table_view.rb",
    "lib/spices/components/table_view_cell.rb",
    "lib/spices/components/collection_view.rb",
    "lib/spices/components/collection_view_cell.rb",
    "lib/spices/components/textfield.rb",
    "lib/spices/components/text_view.rb",
    "lib/spices/components/view.rb",
    "lib/spices/components/scroll_view.rb",
    "lib/spices/components/web_view.rb",
    "lib/spices/components/web_view_css_element.rb",
    "lib/spices/components/web_view_xpath_element.rb",
    "lib/spices/helpers/keyboard.rb",
    "lib/spices/helpers/screen.rb",
    "lib/spices/helpers/wait.rb",
    "lib/spices/logger/logger.rb",
    "lib/spices/mixins/editable.rb",
    "lib/spices/mixins/scrollable.rb",
    "lib/spices/mixins/selectable.rb",
    "lib/spices.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/spices'
  s.license     = 'MIT'
  s.add_dependency('awesome_print', '~> 1.6')
end
