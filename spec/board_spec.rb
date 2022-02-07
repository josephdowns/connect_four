require "./lib/board"
require "pry"
require "rspec"

RSpec.describe Board do
  it "establish an empty board" do
    game1 = Board.new
    expect(game1).to be_instance_of(Board)
  end
end
