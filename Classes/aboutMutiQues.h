//
//  aboutMutiQues.h
//  glassshoes
//
//  Created by james Lee on 11/09/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "oyaController.h"

@interface aboutMutiQues : oyaController {

	id m_parent;
	IBOutlet UIButton* m_backBtn;
	
	IBOutlet UIImageView*	m_bkImg;
	IBOutlet UIImageView*	m_paperImg;
	IBOutlet UIImageView*	m_titleImg;
	
	UIView*	m_layer1;
	UIView*	m_layer2;
	UIView*	m_layer3;
	
	UIView*	m_view1;
	UIView*	m_view2;
	UIView*	m_view3;
	
	UIImageView* m_q1Img;
	UILabel* m_ques1L;
	UIImageView* m_about1Img;
	UILabel* m_about1L;
	UIImageView* m_answer1Img;
	UILabel* m_nameA1L;
	UILabel* m_anwerA1L;
	UILabel* m_infoA1L;
	UILabel* m_nameB1L;
	UILabel* m_anwerB1L;
	UILabel* m_infoB1L;
	UILabel* m_nameC1L;
	UILabel* m_anwerC1L;
	UILabel* m_infoC1L;
	UILabel* m_nameD1L;
	UILabel* m_anwerD1L;
	UILabel* m_infoD1L;
	
	UIImageView* m_q2Img;
	UILabel* m_ques2L;
	UIImageView* m_about2Img;
	UILabel* m_about2L;
	UIImageView* m_answer2Img;
	UILabel* m_nameA2L;
	UILabel* m_anwerA2L;
	UILabel* m_infoA2L;
	UILabel* m_nameB2L;
	UILabel* m_anwerB2L;
	UILabel* m_infoB2L;
	UILabel* m_nameC2L;
	UILabel* m_anwerC2L;
	UILabel* m_infoC2L;
	UILabel* m_nameD2L;
	UILabel* m_anwerD2L;
	UILabel* m_infoD2L;
	
	UIImageView* m_q3Img;
	UILabel* m_ques3L;
	UIImageView* m_about3Img;
	UILabel* m_about3L;
	UIImageView* m_answer3Img;
	UILabel* m_nameA3L;
	UILabel* m_anwerA3L;
	UILabel* m_infoA3L;
	UILabel* m_nameB3L;
	UILabel* m_anwerB3L;
	UILabel* m_infoB3L;
	UILabel* m_nameC3L;
	UILabel* m_anwerC3L;
	UILabel* m_infoC3L;
	UILabel* m_nameD3L;
	UILabel* m_anwerD3L;
	UILabel* m_infoD3L;
	
	IBOutlet UIImageView* m_leftCursor;
	IBOutlet UIImageView* m_rightCursor;
	IBOutlet UIImageView* m_downCursor;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_profileNo;	// 0 == me
	NSInteger m_from;
	
	NSInteger	m_cnt;

	BOOL		m_inMove;
	CGPoint		m_startPt;
	NSInteger m_maxY;
	NSInteger m_page_maxY[5];
	NSInteger m_curQues;
	NSInteger m_curView;
}

@property(nonatomic, retain)id m_parent;
@property(nonatomic, retain)UIButton* m_backBtn;

@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_paperImg;
@property(nonatomic, retain)UIImageView* m_titleImg;

@property(nonatomic, retain)UIView*	m_layer1;
@property(nonatomic, retain)UIView*	m_layer2;
@property(nonatomic, retain)UIView*	m_layer3;

@property(nonatomic, retain)UIView*	m_view1;
@property(nonatomic, retain)UIView*	m_view2;
@property(nonatomic, retain)UIView*	m_view3;

@property(nonatomic, retain)UIImageView* m_q1Img;
@property(nonatomic, retain)UILabel* m_ques1L;
@property(nonatomic, retain)UIImageView* m_about1Img;
@property(nonatomic, retain)UILabel* m_about1L;
@property(nonatomic, retain)UIImageView* m_answer1Img;
@property(nonatomic, retain)UILabel* m_nameA1L;
@property(nonatomic, retain)UILabel* m_anwerA1L;
@property(nonatomic, retain)UILabel* m_infoA1L;
@property(nonatomic, retain)UILabel* m_nameB1L;
@property(nonatomic, retain)UILabel* m_anwerB1L;
@property(nonatomic, retain)UILabel* m_infoB1L;
@property(nonatomic, retain)UILabel* m_nameC1L;
@property(nonatomic, retain)UILabel* m_anwerC1L;
@property(nonatomic, retain)UILabel* m_infoC1L;
@property(nonatomic, retain)UILabel* m_nameD1L;
@property(nonatomic, retain)UILabel* m_anwerD1L;
@property(nonatomic, retain)UILabel* m_infoD1L;

@property(nonatomic, retain)UIImageView* m_q2Img;
@property(nonatomic, retain)UILabel* m_ques2L;
@property(nonatomic, retain)UIImageView* m_about2Img;
@property(nonatomic, retain)UILabel* m_about2L;
@property(nonatomic, retain)UIImageView* m_answer2Img;
@property(nonatomic, retain)UILabel* m_nameA2L;
@property(nonatomic, retain)UILabel* m_anwerA2L;
@property(nonatomic, retain)UILabel* m_infoA2L;
@property(nonatomic, retain)UILabel* m_nameB2L;
@property(nonatomic, retain)UILabel* m_anwerB2L;
@property(nonatomic, retain)UILabel* m_infoB2L;
@property(nonatomic, retain)UILabel* m_nameC2L;
@property(nonatomic, retain)UILabel* m_anwerC2L;
@property(nonatomic, retain)UILabel* m_infoC2L;
@property(nonatomic, retain)UILabel* m_nameD2L;
@property(nonatomic, retain)UILabel* m_anwerD2L;
@property(nonatomic, retain)UILabel* m_infoD2L;

@property(nonatomic, retain)UIImageView* m_q3Img;
@property(nonatomic, retain)UILabel* m_ques3L;
@property(nonatomic, retain)UIImageView* m_about3Img;
@property(nonatomic, retain)UILabel* m_about3L;
@property(nonatomic, retain)UIImageView* m_answer3Img;
@property(nonatomic, retain)UILabel* m_nameA3L;
@property(nonatomic, retain)UILabel* m_anwerA3L;
@property(nonatomic, retain)UILabel* m_infoA3L;
@property(nonatomic, retain)UILabel* m_nameB3L;
@property(nonatomic, retain)UILabel* m_anwerB3L;
@property(nonatomic, retain)UILabel* m_infoB3L;
@property(nonatomic, retain)UILabel* m_nameC3L;
@property(nonatomic, retain)UILabel* m_anwerC3L;
@property(nonatomic, retain)UILabel* m_infoC3L;
@property(nonatomic, retain)UILabel* m_nameD3L;
@property(nonatomic, retain)UILabel* m_anwerD3L;
@property(nonatomic, retain)UILabel* m_infoD3L;

@property(nonatomic, retain)UIImageView* m_leftCursor;
@property(nonatomic, retain)UIImageView* m_rightCursor;
@property(nonatomic, retain)UIImageView* m_downCursor;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(id)oya left:(NSInteger)leftNo right:(NSInteger)rightNo from:(NSInteger)from;
-(void)removeView1;
-(void)removeView2;
-(void)removeView3;

- (void)moveToLeft;
- (void)moveToRight;

- (void)showQues:(NSInteger)qNo place:(NSInteger)place viewNo:(NSInteger)viewNo;

-(NSString*)getMutiQuestion:(NSInteger)quizNo place:(NSInteger)place;

- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font;

-(IBAction)selToBack:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
