class LinkedList

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
  end

  def get(i)
    raise IndexError if i < 0
    item = @first_item
    i.times do
      break if item.nil?
      item = item.next_list_item
    end
    raise IndexError if item.nil?
    item.payload
  end
end
