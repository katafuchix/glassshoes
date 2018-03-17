//
//  myGlassController.h
//  glassshoes
//
//  Created by james Lee on 11/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GSSOLD_LX	20
#define GSSOLD_RX	20
#define GLASS_CX	120
#define GLASS_CY	26
#define GLASS_MY	104

@interface myGlassController : UIViewController {

	NSMutableArray* m_imgList;
	UIImageView*	m_glassView;
}

@property( nonatomic, retain )NSMutableArray* m_imgList;
@property( nonatomic, retain )UIImageView*	m_glassView;

- (void)setInfo:(BOOL)bMan color:(NSInteger)color data:(NSMutableArray*)data type:(NSInteger)type left:(BOOL)bLeft;
- (UIImage*)makeMyGlass:(BOOL)bMan data:(NSMutableArray*)data left:(BOOL)bLeft;
- (UIImage*)makeMutiGlass:(BOOL)bMan color:(NSInteger)color data:(NSMutableArray*)data left:(BOOL)bLeft;

- (void)clearLists;

@end
