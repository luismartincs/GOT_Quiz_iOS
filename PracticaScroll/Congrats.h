//
//  Congrats.h
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 28/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface Congrats : UIViewController

@property (nonatomic,strong) ViewController *parent;

@property (strong, nonatomic) IBOutlet UILabel *correctLabel;
@property (strong, nonatomic) IBOutlet UILabel *messages;
@property (strong, nonatomic) IBOutlet UILabel *result;

@property(nonatomic) NSInteger correct;

- (IBAction)tryAgain:(id)sender;

@end
