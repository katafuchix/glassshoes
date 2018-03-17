//
//  chkSaveController.h
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface chkSaveController : UIViewController {

	id m_parent;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UIButton* m_meBtn;
	IBOutlet UIButton* m_friendBtn;
	IBOutlet UIButton* m_cancelBtn;
}

@property( nonatomic, retain )id m_parent;

@property( nonatomic, retain )UIImageView* m_bkImg;
@property( nonatomic, retain )UIButton* m_meBtn;
@property( nonatomic, retain )UIButton* m_friendBtn;
@property( nonatomic, retain )UIButton* m_cancelBtn;

- (void)setInfo:(id)oya;

- (IBAction)selToMe:(id)sender;
- (IBAction)selToFriend:(id)sender;
- (IBAction)selToCancel:(id)sender;

@end
