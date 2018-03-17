//
//  aboutType.h
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "oyaController.h"

@interface aboutType : oyaController {

	id m_parent;
	
	IBOutlet UIButton* m_backBtn;
	UIImageView* m_typeImg;
	UIImageView* m_infoImg;
	
	IBOutlet UIImageView*	m_bkImg;
	
	IBOutlet UIView*		m_scrollView;
	IBOutlet UILabel*		m_infoLabel;
	IBOutlet UIImageView*	m_cursorImg;
	
	IBOutlet UIImageView*	m_tabBar;
	
	IBOutlet UIButton*	m_top;
	IBOutlet UIButton*	m_profile;
	IBOutlet UIButton*	m_history;
	IBOutlet UIButton*  m_search;
	IBOutlet UIButton*	m_setting;
	UIImageView* m_badgeImg;
	
	NSInteger m_profileNo;	// 0 == me
							// 1+ = friends
	BOOL m_bFromFit;
	
	BOOL		m_inMove;
	CGPoint		m_startPt;
	NSInteger	m_maxY;
	
	NSInteger	m_cnt;
}

@property(nonatomic, retain)id m_parent;
@property(nonatomic, retain)UIButton* m_backBtn;
@property(nonatomic, retain)UIImageView* m_typeImg;
@property(nonatomic, retain)UIImageView* m_infoImg;

@property(nonatomic, retain)UIImageView* m_bkImg;

@property(nonatomic, retain)UIView* m_scrollView;
@property(nonatomic, retain)UILabel* m_infoLabel;
@property(nonatomic, retain)UIImageView*	m_cursorImg;

@property(nonatomic, retain)UIImageView* m_tabBar;

@property(nonatomic, retain)UIButton* m_top;
@property(nonatomic, retain)UIButton* m_profile;
@property(nonatomic, retain)UIButton* m_history;
@property(nonatomic, retain)UIButton* m_search;
@property(nonatomic, retain)UIButton* m_setting;
@property(nonatomic, retain)UIImageView* m_badgeImg;

-(void)setInfo:(id)oya profile:(NSInteger)profileNo from:(BOOL)bFit;

- (NSString*)getTypeInfo:(NSInteger)type;

- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font;

-(IBAction)selToBack:(id)sender;

-(IBAction)selToTop:(id)sender;
-(IBAction)selToProfile:(id)sender;
-(IBAction)selToHistory:(id)sender;
-(IBAction)selToSearch:(id)sender;
-(IBAction)selToSetting:(id)sender;

- (void)moveEnded;

-(void)showBadge;
@end
