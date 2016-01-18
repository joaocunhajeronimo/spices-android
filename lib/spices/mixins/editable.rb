module Editable
  def enter_text(text)
    return unless self['text'] != text
    self[setText: text]
  end
end
