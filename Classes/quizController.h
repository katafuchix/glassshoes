//
//  quizController.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "oyaController.h"

@interface quizController : oyaController {

	IBOutlet UIButton* m_backBtn;
	IBOutlet UIButton* m_chkBtn;
	IBOutlet UIButton* m_lastBtn;
	
	IBOutlet UIImageView* m_blackImg;
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UIImageView* m_wakuImg;
	IBOutlet UIImageView* m_titleImg;
	IBOutlet UIImageView* m_outImg;
	
	IBOutlet UIImageView* m_starImg;
	IBOutlet UIImageView* m_star2Img;
	IBOutlet UIImageView* m_star3Img;
	
	UIImageView* m_quesNoImg;
	UIImageView* m_quesImg;

	IBOutlet UIScrollView* m_answersView;
	IBOutlet UIButton* m_a1Btn;
	IBOutlet UIButton* m_a2Btn;
	IBOutlet UIButton* m_a3Btn;
	IBOutlet UIButton* m_a4Btn;

	IBOutlet UIImageView* m_line1Img;
	IBOutlet UIImageView* m_line2Img;
	IBOutlet UIImageView* m_line3Img;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	BOOL m_bSingle;
	NSInteger m_number;
	
	NSInteger m_curQuiz;
	NSInteger m_nextQuiz;
	
	NSInteger m_starMode;
}

@property(nonatomic, retain)UIImageView* m_quesNoImg;
@property(nonatomic, retain)UIImageView* m_quesImg;
@property(nonatomic, retain)UIScrollView* m_answersView;
@property(nonatomic, retain)UIButton* m_a1Btn;
@property(nonatomic, retain)UIButton* m_a2Btn;
@property(nonatomic, retain)UIButton* m_a3Btn;
@property(nonatomic, retain)UIButton* m_a4Btn;
@property(nonatomic, retain)UIImageView* m_line1Img;
@property(nonatomic, retain)UIImageView* m_line2Img;
@property(nonatomic, retain)UIImageView* m_line3Img;

@property(nonatomic, retain)UIButton* m_backBtn;
@property(nonatomic, retain)UIButton* m_chkBtn;
@property(nonatomic, retain)UIButton* m_lastBtn;

@property(nonatomic, retain)UIImageView* m_titleImg;
@property(nonatomic, retain)UIImageView* m_outImg;

@property(nonatomic, retain)UIImageView* m_blackImg;
@property(nonatomic, retain)UIImageView* m_bkImg;
@property(nonatomic, retain)UIImageView* m_wakuImg;
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

- (void)showStart1;
- (void)showStart2;
- (void)showStart3;

-(void)setInfo:(BOOL)bSingle quizNo:(NSInteger)quizNo num:(NSInteger)num;
-(void)prepareQues:(NSInteger)quizNo;

-(IBAction)selToCheck:(id)sender;
-(IBAction)selToLast:(id)sender;
-(IBAction)selToBack:(id)sender;
-(void)lastBack;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showQuiz;

-(IBAction)selAnswerA:(id)sender;
-(IBAction)selAnswerB:(id)sender;
-(IBAction)selAnswerC:(id)sender;
-(IBAction)selAnswerD:(id)sender;
- (void)selAnswer:(NSInteger)sel;

-(void)showBadge;

@end
