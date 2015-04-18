class ImageMagick
  require 'mkmf'

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

end
