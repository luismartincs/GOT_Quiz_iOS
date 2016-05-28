//
//  CellObserver.h
//  PracticaScroll
//
//  Created by Luis de Jesus Martin Castillo on 28/05/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellObserver <NSObject>

-(void)answerChoosed:(NSInteger)answer withIndex:(NSInteger)index;

@end
