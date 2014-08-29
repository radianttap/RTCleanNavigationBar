RTCleanNavigationBar
====================

UINavigationBar subclass that removes the shadow image while retaining translucency effect in iOS 7 and up

# Usage

You need to initialize the UINavigationController to use this subclass, like this:

``` objective-c
UIViewController *vc = ...;
UINavigationController *nc = [[UINavigationController alloc] 
	initWithNavigationBarClass:[RTCleanNavigationBar class] 
	toolbarClass:nil];
[nc setViewControllers:@[vc]];
...
```

In order for the bar to seamlessly blend with the view controller contents, set its `barTintColor` to the VC's background.

``` objective-c
[[UINavigationBar appearance] setBarTintColor:[UIColor whateverColor]];
```

