gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'List_Node.rb'

class LinkedListTest < Minitest::Test
  def test_node_can_have_different_values
    node1 = List_Node.new('info')
    assert_equal "info", node1.val
    node2 = List_Node.new('pizza')
    assert_equal 'pizza', node2.val
  end

  def test_node_by_default_has_no_next_node
    # skip
    node = List_Node.new('pizza');
    assert_nil node.next
  end

  def test_node_can_have_next_node
    # skip
    node1 = List_Node.new('pizza')
    node2 = List_Node.new('cats')
    node1.next = node2
    assert_equal 'cats', node1.next.val
    assert_instance_of List_Node, node1.next
    assert_instance_of List_Node, node1
  end

  def test_node_can_push_a_single_node_to_a_list
    # skip
    node = List_Node.new('pizza')

    node.push('duck')
    assert_equal 'duck', node.next.val
  end

  def test_node_assigns_next_property_to_first_node_pushed
    # skip
    node = List_Node.new('pizza')

    assert_nil node.next

    node.push('duck')
    assert_equal 'duck', node.next.val

    node.push('goose')
    assert_equal 'duck', node.next.val
  end

  def test_node_attaches_second_node_to_first_node
    # skip
    node = List_Node.new('pizza')

    node.push('duck')
    node.push('swan')

    assert_equal 'duck', node.next.val
    assert_equal 'swan', node.next.next.val
  end

  def test_node_attaches_next_nodes_in_sequential_order
    # skip
    node = List_Node.new('pizza')

    node.push('duck')
    node.push('goose')
    node.push('swan')
    node.push('southern screamer')

    assert_equal 'duck', node.next.val
    assert_equal 'goose', node.next.next.val
    assert_equal 'swan', node.next.next.next.val
    assert_equal 'southern screamer', node.next.next.next.next.val
  end

  def test_nodes_can_be_removed_from_end_of_list
    # skip
    node = List_Node.new('pizza')

    node.push('duck')
    node.push('goose')
    node.push('swan')
    node.push('southern screamer')

    node.pop
    assert_equal 'duck', node.next.val
    assert_equal 'goose', node.next.next.val
    assert_equal 'swan', node.next.next.next.val
    assert_nil node.next.next.next.next

    node.pop
    assert_equal 'duck', node.next.val
    assert_equal 'goose', node.next.next.val
    assert_nil node.next.next.next
  end
end
