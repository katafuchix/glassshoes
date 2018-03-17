//
//  searchingController.h
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "oyaController.h"

@interface searchingController : oyaController {

	id m_parent;
	
	IBOutlet UIImageView* m_char1Img;
	IBOutlet UIImageView* m_char2Img;
	
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_starImg;
	IBOutlet UIImageView* m_star2Img;
	IBOutlet UIImageView* m_star3Img;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_cnt;
	BOOL m_bNear;
	
	NSTimer* m_timeoutTime;
	
	NSInteger m_number;
}

@property(nonatomic, retain)id m_parent;
@property(nonatomic, retain)NSTimer* m_timeoutTime;

@property(nonatomic, retain)UIImageView* m_char1Img;
@property(nonatomic, retain)UIImageView* m_char2Img;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_starImg;
@property(nonatomic, retain)UIImageView* m_star2Img;
@property(nonatomic, retain)UIImageView* m_star3Img;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

- (void)stopTimer;

- (void)showStart1;
- (void)showStart2;
- (void)showStart3;

- (void)commTimeOut:( NSTimer *)aTimer;
- (void)connectCheckTimeOut:( NSTimer *)aTimer;

- (void)setInfo:(id)oya near:(BOOL)bNear;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;
-(void)showBadge;
@end
