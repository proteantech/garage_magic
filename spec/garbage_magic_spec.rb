require_relative '../garage_magic'
require 'oily_png'
require 'spec_helper'

RSpec.describe GarageMagic do
  xit "test_full_blue" do
    puts "\ntest_full_blue"
    rgb = [0,0,255]
    bluish = Bluish.new(rgb)
    puts "Score: #{bluish.score}"
    expect(bluish.bluish?).to eq true
  end

  xit "test_blue_line" do
    puts "\ntest_blue_line"
    image = ChunkyPNG::Image.from_file('squares_and_line.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert good
  end

  xit "test_short_blue_line" do
    puts "\ntest_short_blue_line"
    image = ChunkyPNG::Image.from_file('squares_and_short_blue_line.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert !good
  end

  xit "test_red_line" do
    puts "\ntest_red_line"
    image = ChunkyPNG::Image.from_file('squares_and_red_line.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert !good
  end

  xit "test_overlap_top" do
    puts "\ntest_overlap_top"
    image = ChunkyPNG::Image.from_file('squares_and_line_overlap_top.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert !good
  end

  xit "test_real_overhead" do
    puts "\ntest_real_overhead"
    image = ChunkyPNG::Image.from_file('real_overhead_least.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert good
  end

  xit "test_real_overhead_top_cut" do
    puts "\ntest_real_overhead_top_cut"
    image = ChunkyPNG::Image.from_file('real_overhead_least_top_cut.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    expect(good).to be_true
  end

  it "real_overhead_high_brightness_saturation_scaled640px" do
    puts "\nreal_overhead_high_brightness_saturation_scaled640"
    image = ChunkyPNG::Image.from_file(File.expand_path('images/real_overhead_high_brightness_saturation_scaled640.png', __dir__))
    gm = GarageMagic.new(image)
    good = gm.check_line
    expect(good).to be true
  end


  it "real_overhead_high_brightness_saturation_scaled640_green_top_cut" do
    puts "\nreal_overhead_high_brightness_saturation_scaled640_green_top_cut"
    image = ChunkyPNG::Image.from_file(File.expand_path('images/real_overhead_high_brightness_saturation_scaled640_green_top_cut.png', __dir__))
    gm = GarageMagic.new(image)
    good = gm.check_line
    expect(good).to be false
  end


end

