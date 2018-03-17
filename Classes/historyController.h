//
//  historyController.h
//  glassshoes
//
//  Created by james Lee on 11/09/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface historyController : UIViewController<UITableViewDelegate, UITableViewDataSource> {

	IBOutlet UITableView *m_tableView;	
	IBOutlet UIButton* m_endBtn;
	IBOutlet UIButton* m_editBtn;
	
	IBOutlet UIImageView* m_bkImg;

	IBOutlet UIImageView* m_line1Img;
	IBOutlet UIImageView* m_line2Img;
	IBOutlet UIImageView* m_line3Img;
	IBOutlet UIImageView* m_line4Img;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	IBOutlet UILabel* m_cover;
	
	BOOL m_bFromFit;
	NSInteger m_mode;
	BOOL		m_inMove;
	CGPoint		m_startPt;
}

@property(nonatomic, retain)UITableView *m_tableView;
@property(nonatomic, retain)UIButton* m_endBtn;
@property(nonatomic, retain)UIButton* m_editBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UILabel* m_cover;

@property(nonatomic, retain)UIImageView* m_line1Img;
@property(nonatomic, retain)UIImageView* m_line2Img;
@property(nonatomic, retain)UIImageView* m_line3Img;
@property(nonatomic, retain)UIImageView* m_line4Img;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(IBAction)selToEdit:(id)sender;
-(IBAction)selToEnd:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font;
-(void)showBadge;
@end
