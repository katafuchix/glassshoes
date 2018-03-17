//
//  oyaController.h
//  glassshoes
//
//  Created by james Lee on 11/09/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class chkMoveController;

@interface oyaController : UIViewController {

	chkMoveController* m_chkCtrl;
	
	NSInteger m_mode;
	BOOL m_bAsked;
}

@property( nonatomic, retain )chkMoveController* m_chkCtrl;

- (BOOL)isAsked;
-(void)showMoveConfPage:(NSInteger)tab;
-(void)closeMoveConfPage:(id)sender;

@end
