//
//  GoTCell.m
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 27/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "GoTCell.h"

@implementation GoTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [self setUserInteractionEnabled:YES];
    _answerImage.hidden = YES;
    _index = -1;
}

-(void)setWrong{
    _answerImage.image = [UIImage imageNamed:@"error.png"];
    [_answerImage setHidden:NO];
    [self setUserInteractionEnabled:NO];
}

-(void)setCorrect{
    _answerImage.image = [UIImage imageNamed:@"ok.png"];
    [_answerImage setHidden:NO];
    [self setUserInteractionEnabled:NO];
}

- (IBAction)liveButton:(id)sender {
    if(_isDead == NO){
        _answerImage.image = [UIImage imageNamed:@"ok.png"];
        [_parent answerChoosed:1 withIndex:_index];
    }else{
        _answerImage.image = [UIImage imageNamed:@"error.png"];
        [_parent answerChoosed:2 withIndex:_index];
    }
    [_answerImage setHidden:NO];
    [self setUserInteractionEnabled:NO];
    
}

- (IBAction)deadButton:(id)sender {
    if(_isDead == YES){
        _answerImage.image = [UIImage imageNamed:@"ok.png"];
        [_parent answerChoosed:1 withIndex:_index];
    }else{
        _answerImage.image = [UIImage imageNamed:@"error.png"];
        [_parent answerChoosed:2 withIndex:_index];
    }
    [_answerImage setHidden:NO];
    [self setUserInteractionEnabled:NO];
}
@end
