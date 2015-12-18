require './spices/mixins/selectable'

class CollectionViewCell < BaseComponent
  include Selectable

  private

  def type
    :collectionViewCell
  end
end
