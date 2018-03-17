//
//  typeCell.h
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myGlassController;

@interface typeCell : UITableViewCell {

	IBOutlet UILabel* m_nameLabel;
	
	UIImageView* m_typeImg;
	
	UIImageView* m_typeNameImg;
	
	myGlassController* m_glassCtrl;
}

@property( nonatomic, retain )UIImageView* m_typeImg;
@property( nonatomic, retain )UIImageView* m_typeNameImg;
@property( nonatomic, retain )UILabel* m_nameLabel;
@property( nonatomic, retain )myGlassController* m_glassCtrl;

- (void)setInfo:(NSInteger)profileNo;

@end
