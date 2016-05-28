//
//  Congrats.m
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 28/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Congrats.h"
#import "ViewController.h"

@implementation Congrats


-(void)viewDidLoad{
    [super viewDidLoad];
    
    [_correctLabel setText:[NSString stringWithFormat:@"%i/10 correct answers",_correct]];
    
    if(_correct == 10){
        [_messages setText:@"CONGRATULATIONS!"];
        [_result setText:@"YOU ARE A GAME OF THRONES MASTER"];
    }else if(_correct>=5 && _correct < 10){
        [_messages setText:@"NICE TRY!"];
        [_result setText:@"YOU NEED TO WATCH MORE GAME OF THRONES"];
    }else{
        [_messages setText:@"OHH NO!"];
        [_result setText:@"YOU ARE A LOOSER!"];
    }
}

- (IBAction)tryAgain:(id)sender {
    [_parent restart];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
