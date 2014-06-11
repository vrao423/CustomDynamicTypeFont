Custom Font for iOS Dynamic Type 
=====================

One of the major shortcommings of Dynamic Type in iOS is the inability to use custom fonts. 

To implement custom dynamic type for a project I wrote this code. 

The app that currently uses this code in the store is availible here: www.appstore.com/QEDC.


Requirements
----------
This will only work for iOS 7. I will test with iOS 8 as its release date approaches.


Installation
----------
#### Cocoapods
#### Git Submodule
#### Manual
 Clone this repository and drag UIFont+RSCustom.h/.m and customFont.plist to your project.


Usage
---------

#### Adding Custom Fonts
Adding a Custom Font is a easy but an error can be hard to diagnose if done incorrectly.
##### Add Fonts to Target

Drag your font file to the project and make sure you add the font to the target
![Check Target Membership](/images/target_membership.png)

##### Add Fonts to info.plist
###### Open up your App's info.plist
###### Add a new Array entry called "Fonts provided by Application"
###### Add each custom font filename to the array
![Alt text](/images/Info_plist.png)


#### Defining Custom fonts in pList

You can specify which fonts you want to use for which category in a pList called customFonts. Below is a example.

![Alt text](/images/plist.png)

#### Code

After importing UIFont+RSCustom.h in the necessary file, you can assign a custom font to any font instance like this:

     self.labelBody.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];

Unfortunately, this font will not automatically update if the user changes their preferred text size after you set the font. You need to observe for UIContentSizeCategoryDidChangeNotification in case this unlikely event occurs.

in viewDidLoad/WillAppear/DidAppear add

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
Then implement sizeChanged:

    -(void) sizeChanged:(id) sender {

       self.labelBody.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];
    
       // call invalidateIntrinsicContentSize if using Auto Layout
       [self.labelBody invalidateIntrinsicContentSize];
    }


Feature Requests and Bug Fixes
---------
Please open an issue for bugs and feature requests. I would prefer to to have a discussion about the bug/feature request and then we can discuss who will submit the pull request for the issue.


iOS 8 and XCode 6
--
I will be watching out for updates to XCode 6 and Interface Builder to render the fonts at the right time.


License
---------
MIT License

