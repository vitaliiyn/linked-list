require 'spec_helper'
require 'node'

RSpec.describe "Linked list Node implementation:" do

  subject { Node.new('Lorem ipsum') }

  it "Instantiating a new node returns a Node instance" do
    expect(subject).to be_an_instance_of(Node)
  end

  it "Node's value should be the one that is passed as a parameter" do
    expect(subject.value).to eq('Lorem ipsum')
  end

  it "Next node pointer should be nil" do
    expect(subject.next_node).to be_nil
  end

  it "Node #to_s should return correct templated string" do
    expect(subject.to_s).to eq('Node: Lorem ipsum')
  end
end