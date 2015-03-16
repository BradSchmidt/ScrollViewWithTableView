//
//  ViewController.m
//  ScrollView
//
//  Created by Bradley Robert Schmidt on 3/14/15.
//  Copyright (c) 2015 Bradley Robert Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView1, tableView2, tableView3, tableView4, tableView5;
@synthesize enableScroll, disableScroll;
@synthesize array;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.ScrollView.contentSize = CGSizeMake(590, self.view.frame.size.height);
    
    int x = 125;
    array = @[@"iPhone", @"iPad", @"Apple", @"Computer", @"Objective-c"];
    
    tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(x * 0, 0, x, 350) style:UITableViewStyleGrouped];
    tableView1.dataSource = self;
    tableView1.delegate = self;
    
    tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(x * 1, 0, x, 350) style:UITableViewStyleGrouped];
    tableView2.dataSource = self;
    tableView2.delegate = self;
    
    tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(x * 2, 0, x, 350) style:UITableViewStyleGrouped];
    tableView3.dataSource = self;
    tableView3.delegate = self;
    
    int y = 90;
    tableView4 = [[UITableView alloc] initWithFrame:CGRectMake(x * 3, 0, y, 350) style:UITableViewStyleGrouped];
    tableView4.dataSource = self;
    tableView4.delegate = self;
    
    tableView5 = [[UITableView alloc] initWithFrame:CGRectMake(x * 3 + y, 0, x, 350) style:UITableViewStyleGrouped];
    tableView5.dataSource = self;
    tableView5.delegate = self;
    
    [self.ScrollView addSubview:tableView1];
    [self.ScrollView addSubview:tableView2];
    [self.ScrollView addSubview:tableView3];
    [self.ScrollView addSubview:tableView4];
    [self.ScrollView addSubview:tableView5];
    
    enableScroll = [[UIButton alloc] initWithFrame:CGRectMake(0, 425, 130, 50)];
    [enableScroll setTitle:@"Scroll Window" forState:UIControlStateNormal];
    [enableScroll addTarget:self action:@selector(enable) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:enableScroll];
    
    disableScroll = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 130, 425, 130, 50)];
    [disableScroll setTitle:@"Scroll Data" forState:UIControlStateNormal];
    [disableScroll addTarget:self action:@selector(disable) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:disableScroll];
    
    [self enable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == tableView1) {
        return 10;
    } else if (tableView == tableView2) {
        return 15;
    } else if (tableView == tableView3) {
        return [array count];
    } else if (tableView == tableView4) {
        return 12;
    } else if (tableView == tableView5) {
        return 20;
    }
    return 100;  //return a default value
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)disable
{
    self.ScrollView.scrollEnabled = NO;
    self.tableView1.scrollEnabled = YES;
    self.tableView2.scrollEnabled = YES;
    self.tableView3.scrollEnabled = YES;
    self.tableView4.scrollEnabled = YES;
    self.tableView5.scrollEnabled = YES;
    self.ScrollView.backgroundColor = [UIColor lightGrayColor];
    self.disableScroll.backgroundColor = [UIColor grayColor];
    self.enableScroll.backgroundColor = [UIColor lightGrayColor];
}

- (void)enable
{
    self.ScrollView.scrollEnabled = YES;
    self.tableView1.scrollEnabled = NO;
    self.tableView2.scrollEnabled = NO;
    self.tableView3.scrollEnabled = NO;
    self.tableView4.scrollEnabled = NO;
    self.tableView5.scrollEnabled = NO;
    self.ScrollView.backgroundColor = [UIColor grayColor];
    self.disableScroll.backgroundColor = [UIColor lightGrayColor];
    self.enableScroll.backgroundColor = [UIColor grayColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if (tableView == tableView1) {
    cell.backgroundColor = [UIColor yellowColor];
        cell.textLabel.text = [NSString stringWithFormat:@"table 1 %ld", (long)indexPath.row];
    } else if (tableView == tableView2) {
        cell.backgroundColor = [UIColor greenColor];
        cell.textLabel.text = [NSString stringWithFormat:@"table 2 %ld", (long)indexPath.row];
    } else if (tableView == tableView3) {
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = array[indexPath.row];
    } else if (tableView == tableView4) {
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    } else if (tableView == tableView5) {
        cell.backgroundColor = [UIColor orangeColor];
        cell.textLabel.text = [NSString stringWithFormat:@"table 5 %ld", (long)indexPath.row];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
