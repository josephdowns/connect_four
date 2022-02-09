require './lib/board'
require 'rspec'
require 'pry'

RSpec.describe Board do

  it "starts an empty board" do
    expect(Board.new).to be_instance_of(Board)
  end
  
end
