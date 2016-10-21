//
//  VistaiOS.m
//  LayoutsExampleiOS
//
//  Created by Josue Hernandez Gonzalez on 10/20/16.
//  Copyright © 2016 Josue Hernandez. All rights reserved.
//

#import "VistaiOS.h"

@implementation VistaiOS

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
	Se inicia la vista con un tamaño especificado.
*/
- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setBackgroundColor:[UIColor redColor]];
	}
	return self;
}


-(void) addRestrictions{
	
	
}

@end
