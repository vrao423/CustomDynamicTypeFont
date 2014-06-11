Custom Dynamic Type Font
=====================

While implementing dynamic type for a project and created this small library to implement custom dynamic type fonts. With the announcement for auto resizing cells, Dynamic Type will become even more important. Download the app that currently uses this library here: www.appstore.com/QEDC

----------
Requirements
----------
This will only work for iOS 7.

----------
Installation
----------
#### Cocoapods
#### Git Submodule
#### Manual

---------
Usage
---------

#### Adding Custom Fonts
Adding a Custom Font is a easy process but can be hard to diagnose if proper care is not taken.
##### Add Fonts to Target

Drag your ttf font file to the project and make sure you add the font to the target
![Check Target Membership](/images/target_membership.png)

##### Add Fonts to info.plist
###### Open up your App's info.plist
###### Add a new Array entry called "Fonts provided by Application"
###### Add each custom font file to this entry
![Alt text](/images/Info_plist.png)


#### Defining Custom fonts in pList

To define which fonts you to use for which category you can specify them in the pList called customFonts

![Alt text](/images/plist.png)

#### Code

You can assign a custom font to any font property like this.
    self.labelBody.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];

Unfortunately, this font will not automatically update if the user updates their preferred text size after your view has already loaded. Thus, you can listen for UIContentSizeCategoryDidChangeNotification in case this unlikely event occurs.

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

---------
Feature Requests and Bug Fixes
---------
Please open an issue for bugs and feature requests. I would prefer to to have a discussion about the bug/feature request and then we can discuss who will submit the pull request for the issue.

--
iOS 8 and XCode 6
--
I will be watching out for updates to XCode 6 and Interface Builder to render the fonts at the right time.

---------
License
---------
MIT License

