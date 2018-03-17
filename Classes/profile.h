//
//  profile.h
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface profile : NSObject {

	NSInteger	m_type;
	
	NSString*	m_name;
	BOOL		m_bMan;
	
	NSMutableArray* m_quesLists;
}

@property( nonatomic, retain )NSString* m_name;
@property( nonatomic, retain )NSMutableArray* m_quesLists;

- (id)init:(NSString*)name type:(NSInteger)type bMan:(BOOL)bMan data:(NSMutableArray*)data;

- (NSString*)save;
- (id)load:(NSString*)data;

-(NSInteger)getType;
-(NSInteger)isMan;

@end
