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
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableViewLeadingContraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *backgroundViewLeadingConstraint;
@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) UIViewController *blackViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view sendSubviewToBack: self.menuButton];
    self.blackViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BLACK_VC"];
    [self addChildViewController:self.blackViewController];
    self.blackViewController.view.frame = self.view.frame;
    [self.view insertSubview: self.blackViewController.view belowSubview:self.menuButton];
    [self.blackViewController didMoveToParentViewController:self];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableViewLeadingContraint.constant = -216;
    self.backgroundViewLeadingConstraint.constant = -166;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButtonClicked:(id)sender {
    self.tableViewLeadingContraint.constant = -16;
    self.backgroundViewLeadingConstraint.constant = -50;
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.75 initialSpringVelocity:0.75 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MENU_CELL"];
    cell.mainLabel.text = @"Menu";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tableViewLeadingContraint.constant = -216;
    self.backgroundViewLeadingConstraint.constant = -166;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)dealloc {
    [super dealloc];
    [_backgroundTableView release];
    [_backgroundViewLeadingConstraint release];
    [_tableView release];
    [_tableViewLeadingContraint release];
    [_menuButton release];
    [_blackViewController release];
}

@end
