//
//  ViewController.m
//  SKViewTest
//
//  Created by Zakk Hoyt on 5/28/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "ZHScene.h"

@interface ViewController ()
@property (nonatomic, strong) SKView *skView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.skView = [[SKView alloc]initWithFrame:CGRectMake(0, 0, 400, 400)];
    self.skView.layer.masksToBounds = NO;
    self.skView.allowsTransparency = YES;
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    self.skView.layer.borderColor = [UIColor blackColor].CGColor;
    self.skView.layer.borderWidth = 1.0;
    ZHScene *scene = [ZHScene sceneWithSize:self.skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.backgroundColor = [UIColor clearColor];
    [self.skView presentScene:scene];

    
    [self.view addSubview:self.skView];
    self.skView.center = self.view.center;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
