class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def add(value)
    new_node = Node.new(value)

    if @head
      find_last_node.next_node = new_node
    else
      @head = new_node
    end

    new_node
  end

  def get(value)
    node = search(value)

    puts "Node: #{value} not found in the list" unless node

    puts node
  end

  def delete(value)
    if @head.value == value
      @head = @head.next_node
      return
    end

    node = find_previous_node(value)
    node.next_node = node.next_node.next_node
  end

  def search(value)
    node = @head

    return node if node.value == value

    while node.next_node do
      node = node.next_node

      return node if node.next_node == value
    end
  end

  def print
    node = @head

    puts node

    while node.next_node
      node = node.next_node

      puts node
    end
  end

  def add_after(target_value, new_value)
    node = search(target_value)

    return unless node 

    previous_next_node = node.next_node
    
    node.next_node = Node.new(new_value)

    node.next_node.next_node = previous_next_node
  end

  private

  def find_last_node
    node = @head

    return node unless node.next_node

    while node.next_node do
      node = node.next_node

      return node unless node.next_node
    end
  end

  def find_previous_node(value)
    node = @head

    return nil unless node.next_node

    return node if node.next_node.value == value

    while node.next_node
      node = node.next_node

      return node if node.next_node && node.next_node.value == value
    end
  end
end