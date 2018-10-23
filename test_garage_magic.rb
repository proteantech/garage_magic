require 'chunky_png'
require 'test/unit'
require_relative 'garage_magic'

class TestGarageMagic < Test::Unit::TestCase

  def test_blue_line
    puts "\ntest_blue_line"
    image = ChunkyPNG::Image.from_file('squares_and_line.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert good
  end

  def test_short_blue_line
    puts "\ntest_short_blue_line"
    image = ChunkyPNG::Image.from_file('squares_and_short_blue_line.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert !good
  end

  def test_red_line
    puts "\ntest_red_line"
    image = ChunkyPNG::Image.from_file('squares_and_red_line.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert !good
  end

  def test_overlap_top
    puts "\ntest_overlap_top"
    image = ChunkyPNG::Image.from_file('squares_and_line_overlap_top.png')
    gm = GarageMagic.new(image)
    good = gm.check_line
    assert !good
  end

end
