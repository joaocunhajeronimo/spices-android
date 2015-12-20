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
require 'spices/components/alert'
require 'spices/components/progress_view'
require 'spices/components/image_view'
require 'spices/components/activity_indicator_view'
require 'spices/components/stepper'
require 'spices/components/slider'
require 'spices/components/segmented_control'
require 'spices/components/segment'
require 'spices/components/button'
require 'spices/components/label'
require 'spices/components/navigation_bar'
require 'spices/components/switch'
require 'spices/components/search_bar'
require 'spices/components/tab_bar'
require 'spices/components/tab_bar_button'
require 'spices/components/table_view'
require 'spices/components/table_view_cell'
require 'spices/components/collection_view'
require 'spices/components/collection_view_cell'
require 'spices/components/textfield'
require 'spices/components/text_view'
require 'spices/components/view'
require 'spices/components/scroll_view'
require 'spices/components/web_view'
require 'spices/components/web_view_css_element'
require 'spices/components/web_view_xpath_element'
require 'spices/helpers/keyboard'
require 'spices/helpers/screen'
require 'spices/helpers/wait'
require 'spices/logger/logger'
