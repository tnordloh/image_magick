If you're looking for a more full-featured ruby wrapper for image magick, 
check out the 'rmagick' gem.  This one is very bare-bones, and is only useful
for shrinking images.

Prerequisites: before this gem will work, "Image Magick" must be installed
on your computer. 

On a Mac:
 Given that you are using brew, use this command:

'brew install imagemagick'

I wrote this for my spouse, who needed to resize scanned artwork for various 
art websites, such as 'etsy', 'artpal', and 'art.com'.  Each of these sites has 
specific requirements for file size, format (png, tif, and jpg), or pixel 
dimensions.  There are a few hard-coded parts of the script, that don't hamper 
my use of it, but that I should bring to attention.

Execute the script like this

shrink ./path/to/image [--size 100] [--type [tif|png|jpg]]

You only need to provide image.  Size and type are defaulted to 100 megabytes
and tif respectively.


The output files are hard-coded to be placed in an 'out' directory, at the same
level as the image.  For example, if we're working with a file called

~/images/myimage.tif

the output file will be in 

~/images/out/myimage.tif

The script is very primitive; it runs the 'identify' command to find out
the size of the image.  the 'image' class will respond to things like 'size', 
'width', and 'length'.  

the 'shrink' algorithm is also fairly primitive.  It iteratively tries 
different sizes, using a binary search algorithm to find the best fit that
is as close to the maximum size as possible, without exceeding that size.

run

shrink -h

to see command options
Example usage:

shrink ./image.tif [--size=100] [--type=png]

