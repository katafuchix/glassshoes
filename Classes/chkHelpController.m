//
//  chkHelpController.m
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "chkHelpController.h"
#import "chkResultController.h"
#import "profileController.h"

@implementation chkHelpController

@synthesize m_parent;

@synthesize m_bkImg;
@synthesize m_typeBtn;
@synthesize m_quesBtn;
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
	[m_typeBtn release];
	[m_quesBtn release];
	[m_cancelBtn release];
	
    [super dealloc];
}

- (void)setInfo:(id)oya from:(BOOL)fromFit{
	
	m_parent = oya;
	m_bFromFit = fromFit;
}

- (IBAction)selToType:(id)sender{
	
	if ( m_bFromFit ) {

		chkResultController* oya = (chkResultController*)m_parent;
		[oya showTypeHelpPage];
	}
	else {
		profileController* oya = (profileController*)m_parent;
		[oya showTypeHelpPage];
	}
}

- (IBAction)selToQues:(id)sender{

	if ( m_bFromFit ) {
		
		chkResultController* oya = (chkResultController*)m_parent;
		[oya showQuesHelpPage];
	}
	else {
		profileController* oya = (profileController*)m_parent;
		[oya showQuesHelpPage];
	}
}

- (IBAction)selToCancel:(id)sender{
	
	if ( m_bFromFit ) {
		
		chkResultController* oya = (chkResultController*)m_parent;
		[oya closeHelpSelPage];
	}
	else {
		profileController* oya = (profileController*)m_parent;
		[oya closeHelpSelPage];
	}
}

@end
