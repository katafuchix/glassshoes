//
//  chkSaveController.m
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "chkSaveController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "chkResultController.h"
#import "glassShoes.h"

@implementation chkSaveController

@synthesize m_parent;

@synthesize m_bkImg;
@synthesize m_meBtn;
@synthesize m_friendBtn;
@synthesize m_cancelBtn;

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
	[m_meBtn release];
	[m_friendBtn release];
	[m_cancelBtn release];
	
    [super dealloc];
}

- (void)setInfo:(id)oya{

	m_parent = oya;
}

- (IBAction)selToMe:(id)sender{
	
	glassShoes *gs = [glassShoes sharedInstance];
	chkResultController* oya = (chkResultController*)m_parent;
	if ( [gs haveProfile] == true) {
		
		[oya showReplacePage];
		return;
	}
	
	[gs setProfile:true];
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfilePage:0 from:false];
	[appli.m_gpsCtrl closeChkResultPage];
	
	//[oya closeSaveSelPage];
}

- (IBAction)selToFriend:(id)sender{

	chkResultController* oya = (chkResultController*)m_parent;

	glassShoes *gs = [glassShoes sharedInstance];
	if ( [gs canSaveFriend] ) {

		[gs setProfile:false];
		//[oya closeSaveSelPage];
		
		glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
		[appli.m_gpsCtrl showProfilePage:[gs getNewProfilePos] from:false];
		[appli.m_gpsCtrl closeChkResultPage];
		
	}
	else {

		[oya showOverPage];
	}
}

- (IBAction)selToCancel:(id)sender{
	
	chkResultController* oya = (chkResultController*)m_parent;
	[oya closeSaveSelPage];
}

@end
