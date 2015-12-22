# TODO: Automatic creation of type method
# TODO: Automatic creation of component classes that are empty
class Spices
  attr_accessor :world

  def self.instance
    @spices ||= Spices.new
  end

  def self.world=(world)
    instance.world = world
  end

  def self.world
    instance.world
  end
end

Before do
  Spices.world = self
end

require 'spices/base/base_component'
require 'spices/base/base_screen'

# Android

require 'spices/components/alert'
require 'spices/components/button'
require 'spices/components/check_box'
require 'spices/components/edit_text'
require 'spices/components/image_view'
require 'spices/components/image_button'
require 'spices/components/scroll_view'
require 'spices/components/switch'
require 'spices/components/table_view_cell'
require 'spices/components/table_view'
require 'spices/components/text_view'
require 'spices/components/view'
require 'spices/components/web_view'
require 'spices/components/web_view_css_element'
require 'spices/components/web_view_xpath_element'
require 'spices/helpers/keyboard'
require 'spices/helpers/status_bar'
require 'spices/helpers/screen'
require 'spices/helpers/wait'
require 'spices/logger/logger'
