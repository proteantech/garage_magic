class Bluish

  def initialize(rgb)
    @rgb = rgb
  end
  def bluish?
    rgb_array = @rgb
    r = rgb_array[0]
    g = rgb_array[1]
    b = rgb_array[2]
    # 175 is minimum because when r,b=0, anything less than b=175 looks purple or black
    # green must be less than or equal to blue
    blue_factor = b + g*0.3 - r*0.3
    (blue_factor > 175) && g <= (b-50)
  end
  def score
    rgb_array = @rgb
    r = rgb_array[0]
    g = rgb_array[1]
    b = rgb_array[2]
    # 175 is minimum because when r,b=0, anything less than b=175 looks purple or black
    # green must be less than or equal to blue
    b + g*0.3 - r*0.25
  end

end