//
//  studio_iLeafViewController.m
//  SampleScopeTable
//
//  Created by 平杉 敦史 on 12/08/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "studio_iLeafViewController.h"

@interface studio_iLeafViewController ()

@end

@implementation studio_iLeafViewController

@synthesize navBar = _navBar;
@synthesize searchBar = _searchBar;
@synthesize tableView = _tableView;
@synthesize testView = _testView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    return YES;
}


//検索窓をタップしたときに呼ばれる
-(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         //_navBar.frame = CGRectMake(0, -44, 320, 44);
                         _searchBar.frame = CGRectMake(0, 0, 320, 44);
                     }
     ];
    
    //[self.view bringSubviewToFront:_tableView];
    //[self.view bringSubviewToFront:_testView];
}


-(void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
    [self.view bringSubviewToFront:_tableView];
    //[self.view bringSubviewToFront:_testView];
}


/*
-(void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         //_navBar.frame = CGRectMake(0, 0, 320, 44);
                         _searchBar.frame = CGRectMake(0, 44, 320, 44);
                     }
     ];
}
*/


//検索キャンセルボタンが押されたときに呼ばれる
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         //_navBar.frame = CGRectMake(0, 0, 320, 44);
                         _searchBar.frame = CGRectMake(0, 44, 320, 44);
                     }
     ];
}


#pragma mark -
#pragma mark UITableView data source and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellID = @"cellID";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	cell.textLabel.text = @"aaa";
	return cell;
}


@end
