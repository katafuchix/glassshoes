//
//  openController.m
//  glassshoes
//
//  Created by james Lee on 11/09/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "openController.h"
#import "glassshoesAppDelegate.h"
#import "glassShoes.h"

@implementation openController

@synthesize m_bkImg;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	[NSTimer scheduledTimerWithTimeInterval:2.0
									 target:self
								   selector:@selector(startTimeOut:)
								   userInfo:nil
									repeats:NO];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	
	[m_bkImg release];
    [super dealloc];
}

- (void)startTimeOut:( NSTimer *)aTimer
{
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli setGPSPageShow];
	[appli closeOpenPage];
}

@end
