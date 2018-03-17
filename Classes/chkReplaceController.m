//
//  chkReplaceController.m
//  glassshoes
//
//  Created by james Lee on 11/09/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "chkReplaceController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "chkResultController.h"
#import "glassShoes.h"

@implementation chkReplaceController

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

- (void)setInfo:(id)oya{
	
	m_parent = oya;
}

- (IBAction)selToYes:(id)sender{
	
	glassShoes *gs = [glassShoes sharedInstance];
	[gs setProfile:true];

	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfilePage:0 from:false];
	[appli.m_gpsCtrl closeChkResultPage];
	
	//chkResultController* oya = (chkResultController*)m_parent;
	//[oya closeReplacePage];
}

- (IBAction)selToNo:(id)sender{
	
	chkResultController* oya = (chkResultController*)m_parent;
	[oya closeReplacePage];
}

@end
