UIImage+BluredFrame is a UIImage category that blurs an specified frame of a UIImage

#Install

Install with [cocoapods](http://cocoapods.org/)

```
pod 'UIImage+BluredFrame', git: 'https://github.com/Adrian2112/UIImage-BluredFrame.git'
```


#Usage

```
UIImage *img = [UIImage imageNamed:@"myImage"];
CGRect frame = CGRectMake(0, img.size.height - 200, img.size.width, img.size.height - 200);
    
img = [img applyLightBluredAtFrame:frame];

```

<img src="https://raw.github.com/Adrian2112/UIImage-BluredFrame/master/demo_image.png" alt="UIImage-BluredFrame demo" title="UIImage-BluredFrame demo" style="display:block; margin: 10px auto 30px auto; align:center">


##Credits

`UIImage+ImageEffects` category taken from the [2013 wwdc developer](https://developer.apple.com/wwdc/videos/)
videos 'Implementing Engaging UI on iOS'

Methods to crop and merge images from [this stackoverflow answer](http://stackoverflow.com/a/14108694/1293623)


## Author
**Adrián González**

+ [http://github.com/adrian2112](http://github.com/adrian2112)
