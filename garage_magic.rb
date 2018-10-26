require 'oily_png'
require_relative 'bluish'

class GarageMagic
  BLUE_LINE_THRESHOLD = 470

  def initialize(image)
    @image = image
  end
  def check_line
    image = @image
    puts "Image Height: #{image.height}"
    puts "Image Width:  #{image.width}"

    min_blue_y = nil
    max_blue_y = nil
    # quarter = image.width / 4
    # half    = image.width / 2
    # mask_start =  image.width / 5
    # mask_count   =  image.width * 3 / 5
    mask_start =  image.width / 10
    mask_count   =  image.width * 8 / 10
    puts "mask_start=#{mask_start}"
    puts "mask_count=#{mask_count}"
    image.height.times do |y|
      puts "y=#{y}" if y % 100 == 0
      # mask_count.times do |count|
      streak = 0
      image.width.times do |x|
        # x = count + mask_start
        rgb = ChunkyPNG::Color.to_truecolor_bytes(image[x,y])
        bluish = Bluish.new(rgb)
        # if x.between?(224,230) && y == 353
        #   puts "(#{x},#{y}) #{rgb} #{bluish.bluish?} #{bluish.score} streak=#{streak}"
        # end
        if bluish.bluish?
          # puts "blue pixel found at (#{x},#{y}) streak=#{streak}"
          streak += 1
        else
          streak = 0
        end
        if streak > 5
          puts "blue streak found at (#{x},#{y})"
          # we've hit at least 5 blue pixels in a row, it's not just a random blue pixel but looks like part of the line
          min_blue_y ||= [x,y]
          max_blue_y   = [x,y]
          break # move onto the next line.
        end
      end
    end

    if max_blue_y && min_blue_y
      blue_line_height = max_blue_y[1] - min_blue_y[1]
    else
      blue_line_height = 0
    end

    puts "Max Blue: #{max_blue_y}"
    puts "Min Blue: #{min_blue_y}"
    puts "Blue Line Height: #{blue_line_height}"

    return blue_line_height > BLUE_LINE_THRESHOLD

  end

end




