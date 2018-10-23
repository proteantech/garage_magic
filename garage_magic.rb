# require 'RMagick'
# include Magick
#
# cat = ImageList.new("squares_and_line.jpg")
# cat.display
# exit

require 'chunky_png'
require_relative 'bluish'

class GarageMagic
  RED_THRESHOLD       = 100
  GREEN_THRESHOLD     = 201
  GREEN_MIN_THRESHOLD = 120
  BLUE_THRESHOLD      = 160
  BLUE_LINE_THRESHOLD = 400

  def initialize(image)
    @image = image
  end
  def check_line
    image = @image
    colors = Set.new
    blues = []
    min_blue_y = nil
    max_blue_y = nil
    image.height.times do |y|
      image.width.times do |x|
        rgb = ChunkyPNG::Color.to_truecolor_bytes(image[x,y])
        if (rgb != [255, 255, 255]) # White
          colors << rgb
          if Bluish.new(rgb).bluish? # [0,128,255] # blue
            min_blue_y ||= [x,y]
            max_blue_y   = [x,y]
            blues << [x,y]
          end
          # puts "Non-White Pixel Detected @: (#{x}, #{y}) color #{rgb}"
        end
      end
    end

    if max_blue_y && min_blue_y
      blue_line_height = max_blue_y[1] - min_blue_y[1]
    else
      blue_line_height = 0
    end

    puts "Image Height: #{image.height}"
    puts "Image Width:  #{image.width}"
    puts "Max Blue: #{max_blue_y}"
    puts "Min Blue: #{min_blue_y}"
    puts "Blue Line Height: #{blue_line_height}"

    return blue_line_height > BLUE_LINE_THRESHOLD

  end

end




