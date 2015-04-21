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
  and 'art.com'. 

  check out the readme on the github homepage for this gem, to get details on
  usage and limitations.
  EOS
  spec.homepage      = "https://github.com/tnordloh/image_magick"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
