# MJ Image Slider
A Flutter package for all platforms which provides a simple image slider with/without animation

![](https://github.com/miladjalalli/MJ-Image-Slider/blob/master/images/example.gif?raw=true)


##Hoe To Use


Here is an example:

    MJImageSlider(
                images: ["https://picsum.photos/200","https://picsum.photos/200"],  //List of images
                useLocalAssetImages: false, // Set  this to True if images was load from assets Folder
                duration: const Duration(seconds: 3),  //Change Image Duration
                width: 200, //Width of image
                height: 200, //Height of image
                curve: Curves.easeInOutCubicEmphasized, //use this for change images with animation
              ),
    
