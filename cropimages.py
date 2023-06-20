# import required module
import os
from PIL import Image
import numpy as np
 

directory = 'image_gray'

def find_white_corners(im):
    data = np.asarray(im)
    x = np.argwhere(data != 255)
    # print(x)
    left = x[0][1]
    top = x[0][0]
    right = x[-1][1]
    bottom = x[-1][0]
    # return left, top, right, bottom 
    return left + 1, top + 1, right, bottom + 1

# im = Image.open('trainingdataimages/gentrain_001.png')
# left, top, right, bottom = find_white_corners(im)

# im1 = im.crop((left, top, right, bottom))

# im1.save("test.png","PNG")
 
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
        # width, height = im.size
        
        # Setting the points for cropped image
        left, top, right, bottom = find_white_corners(im)

        # Cropped image of above dimension
        # (It will not change original image)
        im1 = im.crop((left, top, right, bottom))
        
        im1.save(f,"PNG")