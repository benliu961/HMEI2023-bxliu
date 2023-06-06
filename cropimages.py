# import required module
import os
from PIL import Image
 

directory = 'trainingdataimages'
 
# iterate over files in
# that directory
for filename in os.listdir(directory):
    f = os.path.join(directory, filename)
    # checking if it is a file
    if os.path.isfile(f):
        # Opens a image in RGB mode
        im = Image.open(f)
        
        # Size of the image in pixels (size of original image)
        # (This is not mandatory)
        width, height = im.size
        
        # Setting the points for cropped image
        left = 116
        top = 48
        right = 806
        bottom = 574

        # Cropped image of above dimension
        # (It will not change original image)
        im1 = im.crop((left, top, right, bottom))
        
        im1.save(f,"PNG")