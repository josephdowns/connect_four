require './lib/board'
require 'rspec'
require 'pry'

RSpec.describe Board do

  it "creates board" do
    # binding.pry
    expect{Board.new}.to output(
      <<~EXPECTED
      .......
      .......
      .......
      .......
      .......
      .......
       EXPECTED
    ).to_stdout
  end

end
