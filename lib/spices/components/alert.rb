class Alert < BaseComponent
  attr_accessor :title
  attr_accessor :msg

  def initialize
    title_descendent = DialogTitle.new
    msg_descendent = TextView.new
    self.descendants = [title_descendent, msg_descendent]
  end

  def self.with_title(title)
    object = new
    title_descendent = DialogTitle.with_text title
    msg_descendent = TextView.new
    object.descendants = [title_descendent, msg_descendent]
    object
  end

  def self.with_msg(msg)
    object = new
    title_descendent = DialogTitle.new
    msg_descendent = TextView.with_text msg
    object.descendants = [title_descendent, msg_descendent]
    object
  end

  def self.with_title_and_msg(title, msg)
    object = new
    title_descendent = DialogTitle.with_text title
    msg_descendent = TextView.with_text msg
    object.descendants = [title_descendent, msg_descendent]
    object
  end

  def message
    TextView.with_parent(self)['text']
  end

  def title
    DialogTitle.with_parent(self)['text']
  end

  private

  def type
    :'android.widget.LinearLayout'
  end
end
