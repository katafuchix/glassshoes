//
//  typeCellController.h
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>

@class typeCell;

@interface typeCellController : UIViewController {

	IBOutlet typeCell* m_cell;
}

@property( nonatomic, retain )typeCell* m_cell;

@end
