//
//  ViewController.m
//  ChangeFont
//
//  Created by Magic on 2018/2/8.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self findCustomFontName];
    
//    self.label.font = [UIFont fontWithName:@"FZLBJW--GB1-0" size:17];
//    self.button.titleLabel.font = [UIFont fontWithName:@"FZLBJW--GB1-0" size:17];

    
}
- (void)findCustomFontName
{
    NSArray * familyNames = [UIFont familyNames];
    for (NSString * familyName in familyNames) {
        NSArray * fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString * fontName in fontNames) {
            NSLog(@"Font:%@\n",fontName);
        }
    }
}

@end
