//
//  helpController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface helpController : UIViewController {

	IBOutlet UIImageView*	m_bkImg;
	IBOutlet UIImageView*	m_wakuImg;
	
	UIView*			m_topLayer;
	UIView*			m_howLayer;
	UIView*			m_jishiLayer;
	
	UIView*	m_topSView;
	UIView*	m_topView;
	UIView*	m_howSView;
	UIView*	m_howView;
	UIView*	m_jishiSView;
	UIView*	m_jishiView;

	UIImageView*	m_topImg;
	UIImageView*	m_topHelp;
	
	UIImageView*	m_howImg;
	UIImageView*	m_selfImg;
	UIImageView*	m_selfHelp;
	UIImageView*	m_mutiImg;
	UIImageView*	m_mutiHelp;
	UIImageView*	m_searchImg;
	UIImageView*	m_searchHelp;
	UIImageView*	m_fittingImg;
	UIImageView*	m_fittingHelp;
	
	UIImageView*	m_leftCursor;
	UIImageView*	m_rightCursor;
	
	UIImageView*	m_jishiImg;
	UIImageView*	m_jishiHelp;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger	m_cnt;
	NSInteger	m_mode;
	
	BOOL		m_inMove;
	CGPoint		m_startPt;
	NSInteger	m_showMode;
	NSInteger	m_maxY;
	
	NSInteger	m_howHeight;
}

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_wakuImg;

@property(nonatomic, retain)UIView* m_topLayer;
@property(nonatomic, retain)UIView*	m_howLayer;
@property(nonatomic, retain)UIView*	m_jishiLayer;

@property(nonatomic, retain)UIView*	m_topSView;
@property(nonatomic, retain)UIView*	m_howSView;
@property(nonatomic, retain)UIView*	m_jishiSView;
@property(nonatomic, retain)UIView*	m_topView;
@property(nonatomic, retain)UIView*	m_howView;
@property(nonatomic, retain)UIView*	m_jishiView;

@property(nonatomic, retain)UIImageView* m_leftCursor;
@property(nonatomic, retain)UIImageView* m_rightCursor;

@property(nonatomic, retain)UIImageView*	m_topImg;
@property(nonatomic, retain)UIImageView*	m_topHelp;
@property(nonatomic, retain)UIImageView*	m_howImg;
@property(nonatomic, retain)UIImageView*	m_selfImg;
@property(nonatomic, retain)UIImageView*	m_selfHelp;
@property(nonatomic, retain)UIImageView*	m_mutiImg;
@property(nonatomic, retain)UIImageView*	m_mutiHelp;
@property(nonatomic, retain)UIImageView*	m_searchImg;
@property(nonatomic, retain)UIImageView*	m_searchHelp;
@property(nonatomic, retain)UIImageView*	m_fittingImg;
@property(nonatomic, retain)UIImageView*	m_fittingHelp;
@property(nonatomic, retain)UIImageView*	m_jishiImg;
@property(nonatomic, retain)UIImageView*	m_jishiHelp;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font;

- (void)removeTop;
- (void)removeHow;
- (void)removeJishi;

-(void)startTimeOut:( NSTimer *)aTimer;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

- (void)prepareTopHelp:(NSInteger)place;
- (void)prepareHowHelp:(NSInteger)place;
- (void)prepareSearchHelp:(NSInteger)place;

- (void)moveEnded;

-(void)showBadge;
@end
