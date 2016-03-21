//
//  ViewController.m
//  example
//
//  Created by Cory Smith on 2015-11-13.
//  Copyright © 2015 Feathers. All rights reserved.
//

#import "ViewController.h"
#import "Feathers.h"
#import "FeathersService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FeathersService *todoService = Feathers.services[@"todos"];
    [todoService find:@{@"fuck" : @"you", @"you" : @"dyke"}
           completion:^(NSArray *results, NSError *error) {        
        NSLog(@"%@", results);
    }];
    
    [todoService get:@"1123"
              params:@{@"fuck" : @"you", @"you" : @"dyke"}
           completion:^(id result, NSError *error) {
               NSLog(@"%@", result);
           }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
