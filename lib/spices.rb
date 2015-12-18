# TODO: Use yard syntax documentation for the public API
require 'awesome_print'

class Spices
  require 'calabash-cucumber/wait_helpers'
  require 'calabash-cucumber/operations'

  include Calabash::Cucumber::Operations

  def self.instance
    @spices ||= Spices.new
  end
end

require './spices/base/base_component'
require './spices/base/base_screen'
require './spices/components/alert'
require './spices/components/progress_view'
require './spices/components/image_view'
require './spices/components/activity_indicator_view'
require './spices/components/stepper'
require './spices/components/slider'
require './spices/components/segmented_control'
require './spices/components/segment'
require './spices/components/button'
require './spices/components/label'
require './spices/components/navigation_bar'
require './spices/components/switch'
require './spices/components/search_bar'
require './spices/components/tab_bar'
require './spices/components/tab_bar_button'
require './spices/components/table_view'
require './spices/components/table_view_cell'
require './spices/components/collection_view'
require './spices/components/collection_view_cell'
require './spices/components/textfield'
require './spices/components/text_view'
require './spices/components/view'
require './spices/components/scroll_view'
require './spices/components/web_view'
require './spices/components/web_view_element'
require './spices/helpers/keyboard'
require './spices/helpers/screen'
require './spices/helpers/wait'
require './spices/logger/logger'
