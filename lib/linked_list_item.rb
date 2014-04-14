class LinkedListItem
  include Comparable

  attr_reader :payload
  attr_reader :next_list_item

  def initialize(payload)
    @payload = payload
  end

  def <=>(other_item)
    payload1 = self.payload
    payload2 = other_item.payload

    if payload1.class == payload2.class
      payload1 <=> payload2
    else
      if payload1.class == Symbol
        1
      elsif payload2.class == Symbol
        -1
      elsif payload1.class == Fixnum
        -1
      elsif payload2.class == Fixnum
        1
      end
    end
  end

  def ===(other_item)
    self.object_id == other_item.object_id
  end

  def next_list_item=(item)
    raise ArgumentError if self == item
    @next_list_item = item
  end

  def last?
    @next_list_item.nil?
  end
end
