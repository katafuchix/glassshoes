//
//  chkFitController.h
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chkFitController : UIViewController<UITableViewDelegate, UITableViewDataSource> {

	id m_parent;
	
	IBOutlet UIImageView* m_bkImg;
	IBOutlet UITableView* m_tableView;
	
	IBOutlet UIButton* m_fitBtn;
	IBOutlet UIButton* m_cancelBtn;
	
	NSInteger m_sel;
	NSInteger m_profileNo;
	
	NSInteger m_max;
	BOOL m_from;
}

@property( nonatomic, retain )id m_parent;

@property( nonatomic, retain )UIImageView* m_bkImg;
@property( nonatomic, retain )UITableView* m_tableView;

@property( nonatomic, retain )UIButton* m_fitBtn;
@property( nonatomic, retain )UIButton* m_cancelBtn;

- (void)setInfo:(id)oya profile:(NSInteger)profileNo from:(BOOL)from;

- (IBAction)selToFit:(id)sender;
- (IBAction)selToCancel:(id)sender;


@end
