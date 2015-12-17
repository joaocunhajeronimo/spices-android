class Alert < BaseComponent
  attr_accessor :title
  attr_accessor :msg

  def self.with_title_and_msg(title, msg)
    object = new
    object.title = title
    object.msg = msg
    object
  end

  def type
    if Zucchini.instance.server_version['iOS_version'] == '7.1.0'
      :'view:\'_UIModalItemRepresentationView\''
    else
      :'view:\'_UIAlertControllerView\''
    end
  end

  def visible?
    query_properties(:title) == @title &&
      query_properties(:message) == @msg
  end
end
