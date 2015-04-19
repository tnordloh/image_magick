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

Run ./bin/shrink.rb -h

Example usage:
./bin/shrink.rb ./image.tif [--size=100] [--type=png]
to see command line arguments
