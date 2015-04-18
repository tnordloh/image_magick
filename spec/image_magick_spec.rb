require 'minitest/autorun'

require_relative '../lib/image_magick'
describe ImageMagick do
  it "produces an error if the imagemagick binaries aren't available'" do
    temp_path = ENV["PATH"]
    convert_path = `which convert`.chomp.gsub("/convert","")
    ENV["PATH"] = ENV["PATH"].gsub(convert_path,"")
    
    -> do 
      ImageMagick.exists?
    end.must_raise(RuntimeError)

    ENV["PATH"] = temp_path
  end

  it ""
end
