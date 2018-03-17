//
//  chkMoveController.m
//  glassshoes
//
//  Created by james Lee on 11/09/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "chkMoveController.h"


@implementation chkMoveController

@synthesize m_parent;
@synthesize m_bkImg;
@synthesize m_yesBtn;
@synthesize m_noBtn;

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
	[m_yesBtn release];
	[m_noBtn release];
	
    [super dealloc];
}

- (void)setInfo:(id)oya tab:(NSInteger)tab{
	
	m_parent = oya;
	m_tab = tab;
}

- (IBAction)selToYes:(id)sender{
	
	if ( m_tab == 1 ) {
		
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:m_parent
									   selector:@selector(selToTop:)
									   userInfo:nil
										repeats:NO];	
	}
	else if ( m_tab == 2 ) {
		
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:m_parent
									   selector:@selector(selToProfile:)
									   userInfo:nil
										repeats:NO];	
	}
	else if ( m_tab == 3 ) {
		
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:m_parent
									   selector:@selector(selToHistory:)
									   userInfo:nil
										repeats:NO];	
	}
	else if ( m_tab == 4 ) {
		
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:m_parent
									   selector:@selector(selToSearch:)
									   userInfo:nil
										repeats:NO];	
	}
	else if ( m_tab == 5 ) {
		
		[NSTimer scheduledTimerWithTimeInterval:0.01
										 target:m_parent
									   selector:@selector(selToSetting:)
									   userInfo:nil
										repeats:NO];	
	}
}

- (IBAction)selToNo:(id)sender{
	
	[NSTimer scheduledTimerWithTimeInterval:0.01
									 target:m_parent
								   selector:@selector(closeMoveConfPage:)
								   userInfo:nil
									repeats:NO];	
}


@end
