require './spices/mixins/scrollable'

class TableView < BaseComponent
  include Scrollable

  def scroll_to_row_in_section(section, row)
    fail "The table view only contains #{number_of_sections} sections" unless section < number_of_sections
    fail "The section #{section} only contains #{number_of_rows_in_section section} rows" unless row < number_of_rows_in_section(section)
    self['scrollToRow', row, section]
  end

  def number_of_sections
    self['numberOfSections']
  end

  def number_of_rows_in_section(section)
    self['numberOfRowsInSection:', 0]
  end

  private

  def type
    :tableView
  end
end
