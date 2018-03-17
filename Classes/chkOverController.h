//
//  chkOverController.h
//  glassshoes
//
//  Created by james Lee on 11/09/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface chkOverController : UIViewController {

	id m_parent;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UIButton* m_yesBtn;
	IBOutlet UIButton* m_noBtn;
}

@property( nonatomic, retain )id m_parent;

@property( nonatomic, retain )UIImageView* m_bkImg;
@property( nonatomic, retain )UIButton* m_yesBtn;
@property( nonatomic, retain )UIButton* m_noBtn;

- (void)setInfo:(id)oya;

- (IBAction)selToYes:(id)sender;
- (IBAction)selToNo:(id)sender;


@end
