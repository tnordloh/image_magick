require 'minitest/autorun'

require_relative '../lib/image_magick/image'

describe ImageMagick::Image do
  it "gets file attributes" do
    test_image =  File.dirname(__FILE__) + "/data/black_white_flower.tif"
    i = ImageMagick::Image.new(test_image)
    i.name.to_s.must_equal("./test/data/black_white_flower.tif")
    i.shortname.to_s.must_equal("black_white_flower")
    i.width.must_equal(1950)
    i.length.must_equal(2722)
    i.size.must_equal(9.998)
    i.output_dir.must_equal("./test/data/out")
  end

  it "compresses an image" do
    test_image =  File.dirname(__FILE__) + "/data/black_white_flower.tif"
    i = ImageMagick::Image.new(test_image)
    new_image = i.compress
    path = "./test/data/out/black_white_flower.tif"
    new_image.name.to_s.must_equal(path)
    File.delete(new_image.name)
  end
end
