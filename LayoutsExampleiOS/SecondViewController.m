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
	
	
	
	VistaiOS *firstView = [[VistaiOS alloc] initWithFrame:CGRectMake(20, self.navigationController.navigationBar.frame.size.height + 30, 10, 10)];
	VistaiOS *secondView = [[VistaiOS alloc] initWithFrame:CGRectMake(10, self.navigationController.navigationBar.frame.size.height + 30, 10, 10)];
	
	[firstView setBackgroundColor:[UIColor yellowColor]];
	[secondView setBackgroundColor:[UIColor blueColor]];
	
	[self.view addSubview:firstView];
	[self.view addSubview:secondView];
	
	firstView.translatesAutoresizingMaskIntoConstraints = NO;
	secondView.translatesAutoresizingMaskIntoConstraints = NO;
	
	//lo primero es crear un diccionario con la referencia a las vistas.
	NSDictionary<NSString *, UIView *> *dictionary = @{@"firstView":firstView,@"secondView":secondView};
	
	//Creamos dos constraints para el Widht y el Height del View
	NSArray *widthFirstView = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[firstView(50)]"
																	  options:0
																	  metrics:nil
																		views:dictionary];
	
	NSArray *hightFirstView = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[firstView(50)]"
																	  options:0
																	  metrics:nil
																		views:dictionary];
	//Colocar secondview 30 pixeles de la firstView
	NSArray *otherConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[firstView]" options:0 metrics:nil views:dictionary];
	
	[firstView addConstraints:widthFirstView];
	[firstView addConstraints:hightFirstView];
	
	
	
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
