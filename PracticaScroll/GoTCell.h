//
//  GoTCell.h
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 27/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellObserver.h"

@interface GoTCell : UITableViewCell

@property(nonatomic,strong) id<CellObserver> parent;

@property (strong, nonatomic) IBOutlet UIImageView *answerImage;
@property (strong, nonatomic) IBOutlet UIImageView *characterImage;
@property (nonatomic) BOOL isDead;
@property (nonatomic) NSInteger index;


- (IBAction)liveButton:(id)sender;
- (IBAction)deadButton:(id)sender;
- (void)setWrong;
- (void)setCorrect;

@end
