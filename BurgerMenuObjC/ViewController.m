//
//  ViewController.m
//  BurgerMenuObjC
//
//  Created by Reid Weber on 11/25/14.
//  Copyright (c) 2014 Reid Weber. All rights reserved.
//

#import "ViewController.h"
#import "MenuTableViewCell.h"

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
    //[self.view insertSubview: self.blackViewController.view belowSubview:self.menuButton];
    [self.blackViewController didMoveToParentViewController:self];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [[MenuTableViewCell alloc] init];
    cell.mainLabel.text = @"Menu";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tableView.frame = CGRectMake(self.view.frame.origin.x - 200, self.view.frame.origin.y, 200, self.view.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)setUpProperties {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x - 200, self.view.frame.origin.y, 200, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.menuButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 50, 50)];
    self.menuButton.imageView.image = [[UIImage alloc] initWithContentsOfFile:@"menu-50"];
    self.menuButton.backgroundColor = [UIColor greenColor];
    [self.menuButton addTarget:self action:@selector(menuButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menuButton];
    
    self.blackViewController = [[UIViewController alloc] init];
    self.blackViewController.view.frame = self.view.frame;
    self.blackViewController.view.backgroundColor = [UIColor grayColor];
}

- (void) menuButtonTouched:(id)sender {
    self.tableView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 200, self.view.frame.size.height);
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.75 initialSpringVelocity:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view layoutIfNeeded];
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
