class Image
  
  def initialize(array)
    @image = array
    #puts "value 1 #{@image}"  #intial input array
  end

  def output_image
    @image.each do |row|
      puts row.join  #output of processed image row
    end
  end

  # blur(distance) method - Manhatten distance  
  def blur!(distance)
    distance.times do
      blur_coords!
    end
  end

  private

  def blur_coords!
    blur_coords = []
    @image.each_with_index do |row, i|
      row.each_with_index do |x, row_i|
        blur_coords << [i, row_i] if x == 1
      end 
    end

    #puts "blur coordinates#{blur_coords}"  #coordinates from intial input array
    blur_coords.each do |coord|
      @image[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @image[coord[0]].length - 1
      @image[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
      @image[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @image.length - 1
      @image[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0]
])

image.blur!(1)
image.output_image