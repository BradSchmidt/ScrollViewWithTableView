//
//  ViewController.h
//  ScrollView
//
//  Created by Bradley Robert Schmidt on 3/14/15.
//  Copyright (c) 2015 Bradley Robert Schmidt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

@property (nonatomic, strong) UIButton *enableScroll;
@property (nonatomic, strong) UIButton *disableScroll;

@property (nonatomic, strong) UITableView *tableView1;
@property (nonatomic, strong) UITableView *tableView2;
@property (nonatomic, strong) UITableView *tableView3;
@property (nonatomic, strong) UITableView *tableView4;
@property (nonatomic, strong) UITableView *tableView5;

@property (nonatomic, strong) NSArray *array;

@end
