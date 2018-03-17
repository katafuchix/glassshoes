//
//  chkHelpController.h
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chkHelpController : UIViewController {

	id m_parent;
	
	IBOutlet UIImageView* m_bkImg;
	
	IBOutlet UIButton* m_typeBtn;
	IBOutlet UIButton* m_quesBtn;
	IBOutlet UIButton* m_cancelBtn;
	
	BOOL m_bFromFit;
}

@property( nonatomic, retain )id m_parent;

@property( nonatomic, retain )UIImageView* m_bkImg;
@property( nonatomic, retain )UIButton* m_typeBtn;
@property( nonatomic, retain )UIButton* m_quesBtn;
@property( nonatomic, retain )UIButton* m_cancelBtn;

- (void)setInfo:(id)oya from:(BOOL)fromFit;

- (IBAction)selToType:(id)sender;
- (IBAction)selToQues:(id)sender;
- (IBAction)selToCancel:(id)sender;

@end
