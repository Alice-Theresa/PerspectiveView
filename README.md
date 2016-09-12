# PerspectiveView

预览

![Demo.gif](./Demo.gif)

创建并初始化PerspectiveView对象，设置后添加至视图即可

设置背景图片
```
- (void)settingImage:(UIImage *)image
```

设置放大倍率，倍率越大，可透视范围越大，默认1.1倍
```
- (void)settingMultple:(CGFloat)multiple
```

设置透视方向，可设置为单一透视方向
```
- (void)settingPerspectiveDirection:(PerspectiveDirection)mode
```

开启透视效果
```
- (void)enablePerspective
```