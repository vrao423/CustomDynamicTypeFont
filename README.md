Custom Dynamic Type Font
=====================

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
### Add Fonts to Target
## Drag your ttf font file to the project, make sure you add the font to the target
![Check Target Membership](target_membership.png)

### Add Font to info.plist
![Alt text](Info_plist.png)


#### Defining Custom fonts in pList

To define which fonts you to use for which category you can specify them in the pList called customFonts

![Alt text](plist.png)

#### Code

    self.labelBody.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];

Additionally, you can listen for UIContentSizeCategoryDidChangeNotification in case the user changes the setting while using your app.

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
iOS 8
--

---------
License
---------
MIT License

