//
//  ZHScene.m
//  SKViewTest
//
//  Created by Zakk Hoyt on 5/28/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "ZHScene.h"

@interface ZHScene ()
@property (nonatomic, strong) SKEmitterNode *burstEmitter;
@end

@implementation ZHScene


- (instancetype)initWithSize:(CGSize)size{
    self = [super initWithSize:size];
    if (self) {
        NSString *burstPath = [[NSBundle mainBundle] pathForResource:@"rain" ofType:@"sks"];
        
        self.burstEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
        self.burstEmitter.position = CGPointMake(self.size.width / 2.0, self.size.height / 2.0);

        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(self.burstEmitter.parent){
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInNode:self];
    self.burstEmitter.position = point;
    self.burstEmitter.particleBirthRate = 0;
    [self addChild:self.burstEmitter];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.burstEmitter.particleBirthRate = 10;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.burstEmitter.particleBirthRate = 0;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeAllChildren];
            });
            
        });

    });
    
}
@end
