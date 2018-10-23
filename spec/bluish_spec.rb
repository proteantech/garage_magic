require 'chunky_png'
require 'test/unit'
require_relative '../bluish'

require 'spec_helper'
RSpec.describe Bluish do
  it "test_full_blue" do
    puts "\ntest_full_blue"
    rgb = [0,0,255]
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq true
  end

  it "test_full_blue_green_max_threshold" do
    puts "\ntest_full_blue_green_max_threshold"
    rgb = [0,205,255]
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq true
  end

  it "test_full_blue_green_max_threshold_with_some_red" do
    puts "\ntest_full_blue_green_max_threshold"
    rgb = [179,205,255] # light purple
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq true
  end

  it "test_graduated_values" do
    puts "\ntest_graduated_values"
    rgb = [56,97,171] # pastel blue
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq true
  end

  it "test_graduated_values_with just enough red to turn purple" do
    puts "\ntest_graduated_values_with just enough red to turn purple"
    rgb = [90,97,171] # pastel blue
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq false
  end

  it "test_full_green_blue" do
    puts "\ntest_full_green_blue"
    rgb = [0,255,255]
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq false
  end
  it "test_full_red_green_blue" do
    puts "\ntest_full_red_green_blue"
    rgb = [255,255,255]
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq false
  end
end

