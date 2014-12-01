//
//  ViewController.m
//  BurgerMenuObjC
//
//  Created by Reid Weber on 11/25/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ViewController.h"
#import "MenuTableViewCell.h"
#import "CustomCoreGraphicsView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIView *backgroundTableView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) UIViewController *blackViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpProperties];
    [self.blackViewController didMoveToParentViewController:self];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    CustomCoreGraphicsView *customView = [[CustomCoreGraphicsView alloc] init];
    
    [self.view addSubview:customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [[[MenuTableViewCell alloc] init] autorelease];
    cell.backgroundColor = [UIColor darkGrayColor];
    cell.mainLabel.text = @"Menu";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:0.5 animations:^{
        self.tableView.frame = CGRectMake(self.view.frame.origin.x - 200, self.view.frame.origin.y, 200, self.view.frame.size.height);
    }];
}

- (void)setUpProperties {
    self.tableView = [[[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x - 200, self.view.frame.origin.y, 200, self.view.frame.size.height) style:UITableViewStylePlain] autorelease];
    self.tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tableView];
    
    self.menuButton = [[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 50, 50)] autorelease];
    [self.menuButton setImage: [UIImage imageNamed:@"menu-50"] forState:UIControlStateNormal];
    [self.menuButton addTarget:self action:@selector(menuButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuButton];
    
    self.blackViewController = [[[UIViewController alloc] init] autorelease];
    self.blackViewController.view.frame = self.view.frame;
    self.blackViewController.view.backgroundColor = [UIColor grayColor];
}

- (void) menuButtonTouched:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.75 initialSpringVelocity:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.tableView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 200, self.view.frame.size.height);
    } completion:nil];
}

- (void)dealloc {
    [super dealloc];
    [_backgroundTableView release];
    [_tableView release];
    [_menuButton release];
    [_blackViewController release];
}

@end
