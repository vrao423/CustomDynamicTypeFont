//
//  RSMainViewController.m
//  CustomFontTester
//
//  Created by Venkat Rao on 11/29/13.
//  Copyright (c) 2013 Rao Studios. All rights reserved.
//

#import "RSMainViewController.h"
#import "UIFont+RSCustom.h"

@interface RSMainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelBody;
@property (weak, nonatomic) IBOutlet UILabel *labelCaption1;
@property (weak, nonatomic) IBOutlet UILabel *labelCaption2;
@property (weak, nonatomic) IBOutlet UILabel *labelFootnote;
@property (weak, nonatomic) IBOutlet UILabel *labelHeadline;
@property (weak, nonatomic) IBOutlet UILabel *labelSubhead;

@end

@implementation RSMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIFontDescriptor *robotoDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:@{UIFontDescriptorFamilyAttribute:@"Roboto"}];
    NSArray *matches = [robotoDescriptor matchingFontDescriptorsWithMandatoryKeys:nil];
    NSLog(@"matches: %@", matches);

    [self sizeChanged:nil];



    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];

}

-(void) sizeChanged:(id) sender {

    self.labelBody.font = [UIFont customFontForTextStyle:UIFontTextStyleBody];
    self.labelCaption1.font = [UIFont customFontForTextStyle:UIFontTextStyleCaption1];
    self.labelCaption2.font = [UIFont customFontForTextStyle:UIFontTextStyleCaption2];
    self.labelFootnote.font = [UIFont customFontForTextStyle:UIFontTextStyleFootnote];
    self.labelHeadline.font = [UIFont customFontForTextStyle:UIFontTextStyleHeadline];
    self.labelSubhead.font = [UIFont customFontForTextStyle:UIFontTextStyleSubheadline];

    [self.labelBody invalidateIntrinsicContentSize];
    [self.labelCaption1 invalidateIntrinsicContentSize];
    [self.labelCaption2 invalidateIntrinsicContentSize];
    [self.labelFootnote invalidateIntrinsicContentSize];
    [self.labelHeadline invalidateIntrinsicContentSize];
    [self.labelSubhead invalidateIntrinsicContentSize];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
