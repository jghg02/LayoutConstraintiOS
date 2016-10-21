//
//  ViewController.m
//  LayoutsExampleiOS
//
//  Created by Josue Hernandez Gonzalez on 10/20/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

#import "ViewController.h"
#import "VistaiOS.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	//Creo mi vista
	VistaiOS *centerView = [[VistaiOS alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
	
	//Desactivamos las restricciones
	[centerView setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	//Agregamos a la vista
	[self.view addSubview:centerView];
	
	// Width constraint
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
														  attribute:NSLayoutAttributeWidth
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeWidth
														 multiplier:.5
														   constant:0]];
	
	// Height constraint
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
														  attribute:NSLayoutAttributeHeight
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeHeight
														 multiplier:.2
														   constant:0]];
	
	// Center horizontally
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
														  attribute:NSLayoutAttributeCenterX
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterX
														 multiplier:1.0
														   constant:0.0]];
	
	// Center vertically
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:centerView
														  attribute:NSLayoutAttributeCenterY
														  relatedBy:NSLayoutRelationEqual
															 toItem:self.view
														  attribute:NSLayoutAttributeCenterY
														 multiplier:1.0
														   constant:0.0]];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
