//
//  chkMoveController.h
//  glassshoes
//
//  Created by james Lee on 11/09/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface chkMoveController : UIViewController {

	id m_parent;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UIButton* m_yesBtn;
	IBOutlet UIButton* m_noBtn;

	NSInteger m_tab;
}

@property( nonatomic, retain )id m_parent;

@property( nonatomic, retain )UIImageView* m_bkImg;
@property( nonatomic, retain )UIButton* m_yesBtn;
@property( nonatomic, retain )UIButton* m_noBtn;

- (void)setInfo:(id)oya tab:(NSInteger)tab;

- (IBAction)selToYes:(id)sender;
- (IBAction)selToNo:(id)sender;

@end
