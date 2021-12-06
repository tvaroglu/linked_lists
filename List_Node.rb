class List_Node
  attr_accessor :val, :next

  def initialize(data, next_node=nil)
    @val = data
    @next = next_node
  end

  def push(node)
    current_node = self
    new_node = List_Node.new(node)
    until current_node.next.nil?
      current_node = current_node.next
    end
    current_node.next = new_node
  end

  def pop
    current_node = self
    until current_node.next.next.nil?
      current_node = current_node.next
    end
    current_node.next = nil
  end
end
