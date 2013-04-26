//
//  KickStarterTableViewController.m
//  KickStarterPullDown
//
//  Created by Bill Richards on 4/25/13.
//  Copyright (c) 2013 Bill Richards. All rights reserved.
//

#import "KickStarterTableViewController.h"

#define HeaderHeight 200.0f

@interface KickStarterTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@end


@implementation KickStarterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"graffiti.jpg"]];
    self.imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, HeaderHeight);
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HeaderHeight)];
    tableHeaderView.backgroundColor = [UIColor purpleColor];
    [tableHeaderView addSubview:self.imageView];
    self.tableView.tableHeaderView = tableHeaderView;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"Item %i", indexPath.row+1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UIScrollView delegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yPos = -scrollView.contentOffset.y;
    if (yPos > 0) {
        CGRect imgRect = self.imageView.frame;
        imgRect.origin.y = scrollView.contentOffset.y;
        imgRect.size.height = HeaderHeight+yPos;
        self.imageView.frame = imgRect;
    }
}

@end
