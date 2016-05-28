//
//  ViewController.h
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 27/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoTCell.h"
#import "CellObserver.h"
#import "Congrats.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,CellObserver>


@property (strong, nonatomic) IBOutlet UITableView *gameTable;
@property (nonatomic,strong) NSArray *characters;
@property (nonatomic,strong) NSMutableArray *answers;

@property(nonatomic) NSInteger correct;
@property(nonatomic) NSInteger tries;

- (IBAction)next:(id)sender;

- (void)restart;

@end

