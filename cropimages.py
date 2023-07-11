# Clean the images by cropping the white border from gentrain.m

import os
from PIL import Image
import numpy as np
 
os.chdir('../HMEI2023-bxliu-data/')
directory = 'image_rain'

# Find the coordinates of the white borders if image im
def find_white_corners(im):
    data = np.asarray(im)
    x = np.argwhere(data != 255)
    left = x[0][1]
    top = x[0][0]
    right = x[-1][1]
    bottom = x[-1][0]
    # return left, top, right, bottom 
    return left + 1, top + 1, right, bottom + 1
 
# iterate over files in directory
for filename in os.listdir(directory):
    f = os.path.join(directory, filename)
    # checking if it is a file
    if os.path.isfile(f):
        # Opens a image in RGB mode
        im = Image.open(f)
        
        # Setting the points for cropped image
        left, top, right, bottom = find_white_corners(im)

        # Cropped image of above dimension
        im1 = im.crop((left, top, right, bottom))
        
        im1.save(f,"PNG")