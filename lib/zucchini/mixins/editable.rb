module Editable
  def enter_text(text)
    return unless query_properties(:text) != text

    Wait.for_ui_animation_to_end

    touch

    # Zucchini.instance.map(query_string, :setText, '')
    Zucchini.instance.map(query_string, :setText, text)

    Keyboard.done
  end
end
