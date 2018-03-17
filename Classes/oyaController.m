    //
//  oyaController.m
//  glassshoes
//
//  Created by james Lee on 11/09/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "oyaController.h"
#import "chkMoveController.h"

@implementation oyaController

@synthesize m_chkCtrl;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_chkCtrl = nil;
		m_bAsked = false;
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
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
	
	[self closeMoveConfPage:nil];
	
    [super dealloc];
}

-(void)showMoveConfPage:(NSInteger)tab{
	
	chkMoveController* ctrl = [[chkMoveController alloc] initWithNibName:@"chkMoveController" bundle:[NSBundle mainBundle]];
	self.m_chkCtrl = ctrl;
	[ctrl release];
	
	[self.view addSubview:[m_chkCtrl view]];
	m_chkCtrl.view.frame = CGRectMake( 2, 310, 316, 170);
	[m_chkCtrl setInfo:self tab:tab];
	m_bAsked = true;
}

-(void)closeMoveConfPage:(id)sender{
	
	if( m_chkCtrl != nil ){
		
		[[m_chkCtrl view] removeFromSuperview];
		[m_chkCtrl release];
		m_chkCtrl = nil;
	}
	
	m_mode = 0;
	m_bAsked = false;
}

- (BOOL)isAsked{

	return m_bAsked;
}
	
@end
