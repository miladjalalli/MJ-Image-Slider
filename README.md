

# MJ Image Slider

![](https://github.com/miladjalalli/MJ-Image-Slider/blob/master/images/example.gif?raw=true)


## How To Use


Here is an example:

    MJImageSlider(
                images: ["https://picsum.photos/200","https://picsum.photos/200"], 
                useLocalAssetImages: false, 
                duration: const Duration(seconds: 3), 
                width: 200, 
                height: 200,
                curve: Curves.easeInOutCubicEmphasized,
              ),
    

######  images : List of images
######  useLocalAssetImages : Set  this to True if images was load from assets Folder
######  duration : Change Image Duration
######  width : Width of image
######  height : Height of image
######  curve :  Use this for change images with animation
