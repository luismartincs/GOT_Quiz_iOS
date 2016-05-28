//
//  ViewController.m
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 27/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    NSDictionary *characters = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"]];
    
    for (NSString* key in characters) {
        NSArray *object = [characters objectForKey:key];
        NSLog(@"Image %@",[object objectAtIndex:0]);
    }*/
    
    _characters = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Characters" ofType:@"plist"]];
    _answers = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)answerChoosed:(NSInteger)answer withIndex:(NSInteger)index{
    [_answers replaceObjectAtIndex:index withObject:[NSString stringWithFormat:@"%i",answer]];
    
    if(answer == 1){
        _correct++;
    }
    _tries++;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"GoTCell";
    
    GoTCell *cell = (GoTCell*)[_gameTable dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GoTCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSInteger answerValue = [[_answers objectAtIndex:indexPath.row] integerValue];
    
    NSString *image = [[_characters objectAtIndex:indexPath.row] objectAtIndex:0];
    NSNumber *isDead = [[_characters objectAtIndex:indexPath.row] objectAtIndex:1];

    [[_characters objectAtIndex:indexPath.row] objectAtIndex:0];
    cell.characterImage.image = [UIImage imageNamed:image];
    cell.isDead = [isDead boolValue];
    cell.index = indexPath.row;
    cell.parent = self;
    
    if(answerValue == 1){
        [cell setCorrect];
    }else if(answerValue == 2){
        [cell setWrong];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_characters count];
}

-(void)restart{
    _answers = [NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    [_gameTable setContentOffset:CGPointZero animated:NO];
    [_gameTable reloadData];
    _correct = 0;
    _tries = 0;
}

- (IBAction)next:(id)sender {
    
    if(_tries >= 10){
    
        Congrats *congrats = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"congrats"];
        
        congrats.correct = _correct;
        congrats.parent = self;
        
        [self presentViewController:congrats animated:YES completion:nil];
      
        
    }else{
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Wait!"
                                      message:@"Complete the Quiz"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];

    }
}
@end
