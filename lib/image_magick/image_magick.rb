class ImageMagick
  require 'mkmf'
  require_relative 'image'

  def initialize
    check_binaries
  end

  private

  def self.exists?
    self.new
  end

  def binary_exists?(name)
    !!find_executable(name)
  end

  def check_binaries
    raise RuntimeError,"convert binary doesn't exist" unless binary_exists?('convert')
    raise RuntimeError,"identify binary doesn't exist" unless binary_exists?('identify')
  end

  def self.shrink(file,size,type)

    temp_file="./temp.#{type}"

    p "size is #{size}"
    p "file exists?"
    p File.exist?(file)
    original_image = Image.new(file)

    p original_image
    image = original_image.compress(newsize: original_image.width, type: type)
    p image
    exit if image.size < size

    low  = 0
    high = original_image.width 

    while (high - low) > 1 do 
      @try_size = ( high + low  ) / 2
      p "low: #{low}, high #{high}, try #{@try_size}"
      p "reducing to (#{@try_size})"
      image = original_image.compress(newsize: @try_size, type: type)
      p image.size
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
