class IndexResponseSerializer < ActiveModel::Serializer
  attributes :total, :total_filtered, :items

  def total
    object[:total]
  end

  def total_filtered
    object[:total_filtered]
  end

  def items
    object[:items]
  end
end