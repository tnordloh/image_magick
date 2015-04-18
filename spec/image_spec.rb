require 'minitest/autorun'

require_relative '../lib/image'

describe 'image' do
  it "gets file attributes" do
    test_image =  File.dirname(__FILE__) + "/data/black_white_flower.tif"
    i = Image.new(test_image)
    i.name.to_s.must_equal("./spec/data/black_white_flower.tif")
    i.shortname.to_s.must_equal("black_white_flower")
    i.width.must_equal(7414)
    i.length.must_equal(10348)
    i.size.must_equal(306.9)
    i.output_dir.must_equal("./spec/data/out")
  end

  it "compresses an image" do
    test_image =  File.dirname(__FILE__) + "/data/black_white_flower.tif"
    i = Image.new(test_image)
    new_image = i.compress
    new_image.name.to_s.must_equal("./spec/data/out/black_white_flower.tif")
    File.delete(new_image.name)
  end
end
