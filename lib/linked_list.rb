class LinkedList
  attr_reader :size

  def initialize(*payloads)
    @size = 0
    payloads.each do |payload|
      add_item(payload)
    end
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = lli
    else
      item = @first_item
      until item.last?
        item = item.next_list_item
      end
      item.next_list_item = lli
    end
    @size += 1
  end

  def get(i)
    get_item(i).payload
  end
  alias [] get

  def []=(index, value)
    get_item(index).payload = value
  end

  def indexOf(payload)
    item = @first_item
    position = 0
    until item.nil?
      return position if item.payload == payload
      position += 1
      item = item.next_list_item
    end
    nil
  end

  def last
    if size == 0
      nil
    else
      get(size - 1)
    end
  end

  def remove(index)
    @size -= 1
    if index == 0
      @first_item = @first_item.next_list_item
    else
      previous_item = get_item( index - 1 )
      next_list_item = previous_item.next_list_item.next_list_item
      previous_item.next_list_item = next_list_item
    end
  end

  def to_s
    result = "|"
    item = @first_item
    until item.nil?
      result << " " + item.payload.to_s
      result << "," unless item.last?
      item = item.next_list_item
    end
    result + " |"
  end

  private

  def get_item(i)
    raise IndexError if i < 0 or i >= size
    item = @first_item
    i.times do
      item = item.next_list_item
    end
    item
  end
end
