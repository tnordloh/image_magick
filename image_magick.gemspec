# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_magick/version'

Gem::Specification.new do |spec|
  spec.name          = "image_magick"
  spec.version       = ImageMagick::VERSION
  spec.authors       = ["Timothy Nordloh"]
  spec.email         = ["tnordloh@gmail.com"]

  spec.summary       = %q{A simple interface on Image Magick, for shrinking images.}
  spec.description   = <<-EOS
  This is a very trivial implementation of an interface for Image Magick.  It
  relies on the binaries for Image Magic (identify and convert) to be available
  on the system, and to be in the $PATH.  I wrote this for my spouse, who needed
  to resize scanned artwork for various art websites, such as 'etsy', 'artpal',
  and 'art.com'.  Each of these sites has specific requirements for file size,
  format (png, tif, and jpg), or pixel dimensions.  There are a few hard-coded
  parts of the script, that don't hamper my use of it, but that I should bring
  to attention.
  Execute the script like this
  shrink ./path/to/image [--size 100] [--type tif]
  
  You only need to provide image.  Size and type are defaulted to 100 megabytes
  and tif respectively.


  The script is very primitive; it runs the 'identify' command to find out
  the size of the image.  the 'image' class will respond to things like 'size', 
  'width', and 'length'.  

  the 'shrink' algorithm is also fairly primitive.  It iteratively tries 
  different sizes, using a binary search algorithm to find the best fit that
  is as close to the maximum size as possible, without exceeding that size.
  EOS
  spec.homepage      = "https://github.com/tnordloh/image_magick"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
