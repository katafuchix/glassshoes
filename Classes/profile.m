//
//  profile.m
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "profile.h"
#import "question.h"

@implementation profile

@synthesize m_name;
@synthesize m_quesLists;

- (id)init:(NSString*)name type:(NSInteger)type bMan:(BOOL)bMan data:(NSMutableArray*)data{

	NSString* str = [[NSString alloc] initWithFormat:@"%@", name];
	self.m_name = str;
	[str release];
	
	m_bMan = bMan;
	m_type = type;
	
	m_quesLists = [[NSMutableArray alloc] init];
	
	if ( m_type == 100 ) {

		for( int i= 0; i< 5; i++ ){
			
			question* o = [data objectAtIndex:i];
			question* q = [[question alloc] init2:[o getQuizNo] a1:[o getAnswer:0] a2:[o getAnswer:1] a3:[o getAnswer:2] a4:[o getAnswer:3] sel:[o getTheSel]];
			[m_quesLists addObject:q];
		}
	}
	else {
		
		for( int i= 0; i< 20; i++ ){
			
			question* o = [data objectAtIndex:i];
			question* q = [[question alloc] init2:[o getQuizNo] a1:[o getAnswer:0] a2:[o getAnswer:1] a3:[o getAnswer:2] a4:[o getAnswer:3] sel:[o getTheSel]];
			[m_quesLists addObject:q];
		}
	}
	
	return self;
}

- (void)dealloc {
	
	if ( m_quesLists != nil ) {
		
		[m_quesLists removeAllObjects];
		[m_quesLists release];
		m_quesLists = nil;
	}
	
	[m_name release];
	
    [super dealloc];
}

- (NSString*)save{

	NSInteger man = 0;
	if( m_bMan )
		man = 1;
	
	NSString* bodyText = [[[NSString alloc] initWithFormat:@"%@&%d&%d", m_name, m_type, man ] autorelease];
	
	for ( int i= 0; i < 20; i++ ) {
		
		question* o = [m_quesLists objectAtIndex:i];
		bodyText = [[[NSString alloc] initWithFormat:@"%@&%d&%d&%d&%d&%d&%d", bodyText, [o getQuizNo], [o getAnswer:0], [o getAnswer:1], [o getAnswer:2], [o getAnswer:3], [o getTheSel]] autorelease];
	}	
	
	return bodyText;
}

- (id)load:(NSString*)data{

	NSArray *items = [data componentsSeparatedByString:@"&"];
	if ( [items count] != 123 ) {
		return nil;
	}
	
	NSString* str = [[NSString alloc] initWithFormat:@"%@", [items objectAtIndex:0]];
	self.m_name = str;
	[str release];

	m_type = [[items objectAtIndex:1] intValue];
	
	NSInteger man = [[items objectAtIndex:2] intValue];
	if ( man == 0 ) {
		m_bMan = false;
	}
	else {
		m_bMan = true;
	}

	m_quesLists = [[NSMutableArray alloc] init];
	
	for( int i= 0; i< 20; i++ ){
		
		question* q = [[question alloc] init2:[[items objectAtIndex:(3+i*6)] intValue]
										   a1:[[items objectAtIndex:(4+i*6)] intValue] 
										   a2:[[items objectAtIndex:(5+i*6)] intValue] 
										   a3:[[items objectAtIndex:(6+i*6)] intValue]
										   a4:[[items objectAtIndex:(7+i*6)] intValue] 
										  sel:[[items objectAtIndex:(8+i*6)] intValue] ];
		[m_quesLists addObject:q];
	}
	
	return self;
}

-(NSInteger)getType{

	return m_type;
}

-(NSInteger)isMan{

	return m_bMan;
}
							 
@end
