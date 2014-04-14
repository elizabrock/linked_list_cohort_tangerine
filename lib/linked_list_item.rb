class LinkedListItem
  attr_reader :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload
  end

  def next_list_item=(item)
    raise ArgumentError if self == item
    @next_list_item = item
  end

  def last?
    @next_list_item.nil?
  end
end
