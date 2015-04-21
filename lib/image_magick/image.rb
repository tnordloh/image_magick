module ImageMagick
  class Image

    require 'pathname'
    require_relative '../image_magick'

    def initialize(file)
      #ImageMagick.exists?
      @image = file
      image_data
    end

    attr_accessor :width, :length, :size

    def output_dir(out: "/out")
      output_dir = File.dirname(@image) + out
      Dir.mkdir(output_dir) unless File.exists?(output_dir)
      output_dir
    end

    def image_data
      @fields = identify.split(/\s+/)
      fields = identify.split(/\s+/)
      @width,@length = fields[2].split('x').map {|x| x.to_i}
      @size = fields[6][/^\d+\.*\d*/].to_f
    end

    def identify
      @identify ||= `identify #{@image}`
    end

    def name
      @name ||= Pathname.new(@fields[0].split('[')[0])
    end

    def shortname
      name.basename(name.extname)
    end

    def compress(type: '.tif', test: false, newsize: 1.0 )
      new_file = output_dir + "/" + shortname.to_s + type
      command = "convert #{name} -resize #{newsize} -compress lzw #{new_file}"
      test == true ? "#{command}" : `#{command}`
      self.class.new(new_file)
    end
  end
end
