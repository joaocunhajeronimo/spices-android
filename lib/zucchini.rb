# TODO: Use yard syntax documentation for the public API

class Zucchini
  require 'calabash-cucumber/wait_helpers'
  require 'calabash-cucumber/operations'

  include Calabash::Cucumber::Operations

  def self.instance
    @zucchini ||= Zucchini.new
  end
end

require './zucchini/base/base_component'
require './zucchini/base/base_screen'
require './zucchini/components/alert'
require './zucchini/components/button'
require './zucchini/components/label'
require './zucchini/components/switch'
require './zucchini/components/tabbar_button'
require './zucchini/components/table_view'
require './zucchini/components/table_view_cell'
require './zucchini/components/textfield'
require './zucchini/components/view'
require './zucchini/components/web_view'
require './zucchini/components/web_view_element'
require './zucchini/helpers/keyboard'
require './zucchini/helpers/screen'
require './zucchini/helpers/wait'
require './zucchini/logger/logger'
