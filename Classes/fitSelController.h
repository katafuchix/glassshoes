//
//  fitSelController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "oyaController.h"

@interface fitSelController : oyaController<UITableViewDelegate, UITableViewDataSource> {

	IBOutlet UITableView *m_tableView;	

	IBOutlet UIButton* m_endBtn;
	IBOutlet UIButton* m_editBtn;
	IBOutlet UIButton* m_backBtn;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	BOOL m_bFromFit;
}

@property(nonatomic, retain)UITableView *m_tableView;
@property(nonatomic, retain)UIButton* m_endBtn;
@property(nonatomic, retain)UIButton* m_editBtn;
@property(nonatomic, retain)UIButton* m_backBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(BOOL)fromFit;

-(IBAction)selToEdit:(id)sender;
-(IBAction)selToEnd:(id)sender;
-(IBAction)selToBack:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
