class Alert < BaseComponent
  attr_accessor :title
  attr_accessor :msg

  def self.with_title_and_msg(title, msg)
    object = new
    title_descendent = Label.with_text title
    msg_descendent = Label.with_text msg
    object.descendants = [title_descendent, msg_descendent]
    object
  end

  def type
    if Spices.instance.server_version['iOS_version'] == '7.1.0'
      :'view:\'_UIModalItemRepresentationView\''
    else
      :'view:\'_UIAlertControllerView\''
    end
  end
end
