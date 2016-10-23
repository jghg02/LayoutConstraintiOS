//
//  SecondViewController.m
//  LayoutsExampleiOS
//
//  Created by Josue Hernandez Gonzalez on 10/21/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

#import "SecondViewController.h"
#import "VistaiOS.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.title = @"VLF";

	VistaiOS *firstView = [[VistaiOS alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + 30, 10, 10)];
	VistaiOS *secondView = [[VistaiOS alloc] initWithFrame:CGRectMake(10, self.navigationController.navigationBar.frame.size.height + 30, 10, 10)];
	
	[firstView setBackgroundColor:[UIColor yellowColor]];
	[secondView setBackgroundColor:[UIColor blueColor]];
	
	[firstView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[secondView setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	[self.view addSubview:secondView];
	[self.view addSubview:firstView];
	
	
	NSDictionary<NSString *, UIView *> *viewsDictionary = @{@"firstView":firstView,@"secondView":secondView};
	
	NSArray *constraint_width = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[firstView(100)]"
																		options:0
																		metrics:nil
																		  views:viewsDictionary];
	
	NSArray *constraint_height = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[firstView(100)]"
																		 options:0
																		 metrics:nil
																		   views:viewsDictionary];
	
	[firstView addConstraints:constraint_width];
	[firstView addConstraints:constraint_height];
	
	NSArray *constraint_pos_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-300-[firstView]"
																		options:0
																		metrics:nil
																		  views:viewsDictionary];
	
	NSArray *constraint_pos_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[firstView]"
																		options:0
																		metrics:nil
																		  views:viewsDictionary];
	
	[self.view addConstraints:constraint_pos_v];
	[self.view addConstraints:constraint_pos_h];
	
	//Second View Contratints
	NSArray *height = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[secondView]|"
															   options:0
															   metrics:nil
																 views:viewsDictionary];
	
	NSArray *width = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[secondView]|"
															   options:0
															   metrics:nil
																 views:viewsDictionary];
	
	[self.view addConstraints:height];
	[self.view addConstraints:width];
	
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
