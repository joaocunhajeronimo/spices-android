require './spices/mixins/scrollable'

class CollectionView < BaseComponent
  include Scrollable

  private

  def type
    :collectionView
  end
end
