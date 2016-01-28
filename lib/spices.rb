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

require 'spices/base/base_component'
require 'spices/components/alert'
require 'spices/components/button'
require 'spices/components/check_box'
require 'spices/components/checked_text_view'
require 'spices/components/drop_down_list_view'
require 'spices/components/edit_text'
require 'spices/components/image_view'
require 'spices/components/image_button'
require 'spices/components/scroll_view'
require 'spices/components/spinner'
require 'spices/components/switch'
require 'spices/components/table_view_cell'
require 'spices/components/table_view'
require 'spices/components/text_view'
require 'spices/components/view'
require 'spices/components/web_view'
require 'spices/components/web_view_css_element'
require 'spices/components/web_view_xpath_element'
require 'spices/components/video_view'
require 'spices/components/dialog_title'
require 'spices/helpers/keyboard'
require 'spices/helpers/status_bar'
require 'spices/helpers/screen'
require 'spices/helpers/wait'
require 'spices/logger/logger'
