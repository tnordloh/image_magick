module ImageMagick
  require 'image'

  def self.shrink(image,size,type)

    TEMP_FILE="./temp.#{type}"

    original_image = Image.new(file)

    image = original_image.compress(newsize: original_image.width, type: @type)
    exit if image.size < @new_size

    low  = 0
    high = original_image.width 

    while (high - low) > 1 do 
      @try_size = ( high + low  ) / 2
      p "low: #{low}, high #{high}, try #{@try_size}"
      p "reducing to (#{@try_size})"
      image = original_image.compress(newsize: @try_size, type: @type)
      p image.size
      if image.size < @new_size 
        low = @try_size
      else
        high = @try_size
      end
    end

    if image.size > @new_size
      image = original_image.compress(newsize: high - 1, type: @type)
    end

  end
end
