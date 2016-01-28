require_relative 'dialog_title'
# Alert will be composed by to separate components.
# Note then when creating an Alert using the with_text method, the text will correspond to the title and not the message.
# TODO: make this an unified component like on iOS
# TODO: allow for a with_message initializer
class Alert < DialogTitle
  # this methos is not actually necessary
  def title
    self['text']
  end

  #TODO: find a better way to implement an Alert and query both title and message
  def message
    TextView.with_id('message')['text']
  end
end
