//
//  singleFittingController.h
//  glassshoes
//
//  Created by james Lee on 11/09/07.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "oyaController.h"

@class myGlassController;

@interface singleFittingController : oyaController {

	myGlassController* m_leftShoes;
	myGlassController* m_rightShoes;
	
	IBOutlet UIImageView* m_bkImg;
	
	UIImageView* m_msg1Img;
	UIImageView* m_msg2Img;
	
	UIImageView* m_guideImg;
	UIImageView* m_guide2Img;
	UIImageView* m_guide3Img;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_nLeft;
	NSInteger m_nRight;
	BOOL m_from;
	BOOL m_bLeft;
	NSInteger m_cnt;
}

@property(nonatomic, retain)myGlassController* m_leftShoes;
@property(nonatomic, retain)myGlassController* m_rightShoes;

@property(nonatomic, retain)UIImageView* m_bkImg;

@property(nonatomic, retain)UIImageView* m_msg1Img;
@property(nonatomic, retain)UIImageView* m_msg2Img;

@property(nonatomic, retain)UIImageView* m_guideImg;
@property(nonatomic, retain)UIImageView* m_guide2Img;
@property(nonatomic, retain)UIImageView* m_guide3Img;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(NSInteger)left right:(NSInteger)right from:(BOOL)from bLeft:(BOOL)bLeft;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

-(void)showBadge;
@end
