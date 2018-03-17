//
//  chkFitController.m
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "chkFitController.h"
#import "glassShoes.h"
#import "profile.h"
#import "chkResultController.h"
#import "profileController.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"

@implementation chkFitController

@synthesize m_parent;

@synthesize m_bkImg;
@synthesize m_fitBtn;
@synthesize m_cancelBtn;

@synthesize m_tableView;

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
	
	[m_tableView release];
	
	[m_bkImg release];
	[m_fitBtn release];
	[m_cancelBtn release];
	
    [super dealloc];
}

- (void)setInfo:(id)oya profile:(NSInteger)profileNo from:(BOOL)from{
	
	m_parent = oya;
	m_profileNo = profileNo;
	m_from = from;

	[m_tableView reloadData];
	
	m_sel = 0;
}

- (IBAction)selToFit:(id)sender{
	
	glassShoes *gs = [glassShoes sharedInstance];
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];

	BOOL leftIsMan = false;
	
	if ( m_profileNo == -1 )
		leftIsMan = [gs isMan];
	else if( m_profileNo == 0 )
		leftIsMan = [gs.m_myProfile isMan];
	else {
		profile* p = [gs.m_friendLists objectAtIndex:(m_profileNo-1)];
		leftIsMan = [p isMan];
	}
	
	if( m_sel == 0 ){

		//BOOL canToken = [gs checkToken];
		//BOOL canLocation = [gs checkLocation];
		BOOL canComm = [appli canDoComm];
		
		if ( !canComm ) {

			// アラートビューを作成する
			UIAlertView *alert;
			alert = [[UIAlertView alloc] initWithTitle:@""
											   message:@"インターネットがオフラインのようです。設定を確認してください。"
											  delegate:nil
									 cancelButtonTitle:@"OK"
									 otherButtonTitles:nil];
			
			// アラートビューを表示する
			[alert show];
			
			// 解放
			[alert release];
			return;
		}

		/*
		if ( !canToken || !canLocation ) {
			
			// アラートビューを作成する
			UIAlertView *alert;
			alert = [[UIAlertView alloc] initWithTitle:@""
											   message:@"電波状況を確認してください。"
											  delegate:nil
									 cancelButtonTitle:@"OK"
									 otherButtonTitles:nil];
			
			// アラートビューを表示する
			[alert show];
			
			// 解放
			[alert release];
			return;
		}
		*/ 
		
		if ( leftIsMan == true ) {

			[appli.m_gpsCtrl showFittingPage:m_profileNo right:-2 from:m_from bLeft:true];
		}
		else {
			
			[appli.m_gpsCtrl showFittingPage:-2 right:m_profileNo from:m_from bLeft:false];
		}
	}
	else if ( m_profileNo != 0 && gs.m_myProfile != nil ) {
	
		NSInteger place = m_sel;
		if ( place == 1 ) {
			
			if ( leftIsMan == true ) {
				
				[appli.m_gpsCtrl showSingleFittingPage:m_profileNo right:0 from:m_from bLeft:true];
			}
			else {
				
				[appli.m_gpsCtrl showSingleFittingPage:0 right:m_profileNo from:m_from bLeft:false];
			}
		}
		else {
			
			if ( place > m_profileNo ) {
				place++;
			}
			
			if ( leftIsMan == true ) {
				
				[appli.m_gpsCtrl showSingleFittingPage:m_profileNo right:(place-1) from:m_from bLeft:true];
			}
			else  {
				[appli.m_gpsCtrl showSingleFittingPage:m_sel right:(place-1) from:m_from bLeft:false];
			}
		}
		
	}
	else {

		NSInteger place = m_sel;
		if ( place > m_profileNo ) {
			place++;
		}
		
		if ( leftIsMan == true ) {
			
			[appli.m_gpsCtrl showSingleFittingPage:m_profileNo right:(place-1) from:m_from bLeft:true];
		}
		else  {
			[appli.m_gpsCtrl showSingleFittingPage:(place-1) right:m_profileNo from:m_from bLeft:false];
		}
	}

	if ( m_profileNo == -1 ) {
		
		[appli.m_gpsCtrl closeChkResultPage];
	}
	else {
		[appli.m_gpsCtrl closeProfilePage];
	}
}

- (IBAction)selToCancel:(id)sender{
	
	if ( m_profileNo == -1 ) {

		chkResultController* oya = (chkResultController*)m_parent;
		[oya closeFitSelPage];
	}
	else {
		profileController* oya = (profileController*)m_parent;
		[oya closeFitSelPage];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
    return nil; //ビルド警告回避用
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	if ( gs.m_friendLists == nil ) {

		m_max = 1;

		if ( m_profileNo != 0 && gs.m_myProfile != nil ) {
			m_max++;
		}
		
		return m_max;
	}
	
	m_max = [gs.m_friendLists count];

	if ( m_profileNo != 0 ){
		
		if( gs.m_myProfile != nil )
			m_max++;
	}
	else {
		m_max++;
	}
	
	return m_max;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	glassShoes *gs = [glassShoes sharedInstance];
	UITableViewCell* cell = (UITableViewCell*)[m_tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if ( cell == nil ) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"] autorelease];			
	}

	if ( indexPath.row == 0 ) {
		cell.textLabel.text = @"合体";
	}
	else if ( m_profileNo != 0 && gs.m_myProfile != nil ) {
	
		NSInteger place = indexPath.row;
		if ( place == 1 ) {
			
			NSString* str = [[NSString alloc] initWithFormat:@"%@", gs.m_myProfile.m_name];
			cell.textLabel.text = str;
			[str release];
		}
		else {
			if ( place > m_profileNo ) {
				place++;
			}
			
			profile* p = [gs.m_friendLists objectAtIndex:(place-2)];
			
			NSString* str = [[NSString alloc] initWithFormat:@"%@", p.m_name];
			cell.textLabel.text = str;
			[str release];
		}
	}
	else {

		NSInteger place = indexPath.row;
		if ( place >= m_profileNo ) {
			place++;
		}
		
		profile* p = [gs.m_friendLists objectAtIndex:(place-2)];
		
		NSString* str = [[NSString alloc] initWithFormat:@"%@", p.m_name];
		cell.textLabel.text = str;
		[str release];
	}
	
	cell.textLabel.textColor = [UIColor whiteColor];
	cell.accessoryType = UITableViewCellAccessoryNone;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 30.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath{
	
	//[tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除をします。
	m_sel = indexPath.row;
}

@end
