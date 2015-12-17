Gem::Specification.new do |s|
  s.name        = 'zucchini'
  s.version     = '0.0.1'
  s.date        = '2015-12-28'
  s.summary     = "Software layer between Calabash and Cucumber"
  s.description = "A gem"
  s.authors     = ["Titouan Van Belle"]
  s.email       = 'titouan.vanbelle@gmail.com'
  s.files       = [
    "lib/zucchini/base/base_component.rb",
    "lib/zucchini/base/base_screen.rb",
    "lib/zucchini/components/alert.rb",
    "lib/zucchini/components/button.rb",
    "lib/zucchini/components/label.rb",
    "lib/zucchini/components/switch.rb",
    "lib/zucchini/components/tabbar_button.rb",
    "lib/zucchini/components/table_view.rb",
    "lib/zucchini/components/table_view_cell.rb",
    "lib/zucchini/components/textfield.rb",
    "lib/zucchini/components/view.rb",
    "lib/zucchini/components/web_view.rb",
    "lib/zucchini/components/web_view_element.rb",
    "lib/zucchini/helpers/keyboard.rb",
    "lib/zucchini/helpers/screen.rb",
    "lib/zucchini/helpers/wait.rb",
    "lib/zucchini/logger/logger.rb",
    "lib/zucchini/mixins/editable.rb",
    "lib/zucchini/mixins/scrollable.rb",
    "lib/zucchini.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/zucchini'
  s.license     = 'MIT'
end
