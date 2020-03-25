require 'spec_helper'
require 'node'
require 'linked_list'
require 'pry'

RSpec.describe "Linked list implementation: " do
  context "When first initialized" do
    subject { LinkedList.new }

    it 'Returns an instanse of LinkedList' do
      expect(subject).to be_an_instance_of(LinkedList)
    end

    it 'List head should be empty' do
      expect(subject.head).to be_nil
    end
  end

  context "When adding new node to the empty list" do
    let!(:linked_list) { LinkedList.new }

    let!(:added_node) { linked_list.add('Lorem ipsum') }

    it 'Returns an instanse of Node' do
      expect(added_node).to be_an_instance_of(Node)
    end

    it 'Returns an node with value passed to LinkedList#add method' do
      expect(added_node.value).to eq('Lorem ipsum')
    end

    it 'List head should be equal to newly created node' do
      expect(linked_list.head).to eq(added_node)
    end
  end

  context "When adding two nodes to the list" do
    it "list head's next node should be pointed to the second added node" do
      linked_list = LinkedList.new

      linked_list.add('First item')
      second_item = linked_list.add('Second item')

      expect(linked_list.head.next_node).to eq(second_item)
    end
  end

  context "When searching node in the list" do
    linked_list = LinkedList.new

    linked_list.add('First item')
    linked_list.add('Second item')


    it "Returns the node if it is present in the list" do
      node = linked_list.search('First item')

      expect(node).not_to be_nil
      expect(node.value).to eq('First item')
    end

    it 'Returns nil if the node is not present in the list' do
      node = linked_list.search('Something in between')

      expect(node).to be_nil
    end
  end

  context "When deleting node from the list" do
    context 'when deleted item is in the middle of the list' do
      linked_list = LinkedList.new

      linked_list.add('First item')
      linked_list.add('Second item')
      third_node = linked_list.add('Third item')

      linked_list.delete('Second item')

      it 'that item should not be found in the list' do
        expect(linked_list.search('Second item')).to be_nil
      end

      it 'items should be connected correctly' do
        expect(linked_list.head.next_node).to eq(third_node)
      end
    end

    context 'when deleting first item in the list' do
      linked_list = LinkedList.new

      linked_list.add('First item')
      second_node = linked_list.add('Second item')

      linked_list.delete('First item')

      it 'list head should be moved to the next node' do
        expect(linked_list.head).to eq(second_node)
      end
    end
  end

  context "When adding after some particular node in the list" do
    linked_list = LinkedList.new

    linked_list.add('First item')
    linked_list.add('Second item')

    target_node = linked_list.search('First item')

    linked_list.add_after(target_node.value, 'Something in between')

    it "The node is added to the list after target node" do
      expect(target_node.next_node.value).to eq('Something in between')
    end
  end
end