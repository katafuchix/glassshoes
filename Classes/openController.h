//
//  openController.h
//  glassshoes
//
//  Created by james Lee on 11/09/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface openController : UIViewController {

	IBOutlet UIImageView*	m_bkImg;
}

@property( nonatomic, retain )UIImageView* m_bkImg;

- (void)startTimeOut:( NSTimer *)aTimer;

@end
