require_relative 'image_magick/version'

module ImageMagick

  require 'mkmf'

  require_relative 'image_magick/image'

  def self.exists?
    raise RuntimeError,"convert binary doesn't exist" unless !!find_executable('convert')
    raise RuntimeError,"identify binary doesn't exist" unless !!find_executable('identify')
  end

  def self.shrink(file,size,type)

    temp_file="./temp.#{type}"
    original_image = ImageMagick::Image.new(file)

    image = original_image.compress(newsize: original_image.width, type: type)
    return image.name if image.size < size

    low  = 0
    high = original_image.width 

    while (high - low) > 1 do 
      @try_size = ( high + low  ) / 2
      image = original_image.compress(newsize: @try_size, type: type)
      if image.size < size
        low = @try_size
      else
        high = @try_size
      end
    end

    if image.size > size
      image = original_image.compress(newsize: high - 1, type: type)
    end

  end
end
