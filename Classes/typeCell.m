//
//  typeCell.m
//  glassshoes
//
//  Created by james Lee on 11/08/19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "typeCell.h"
#import "myGlassController.h"
#import "glassShoes.h"
#import "profile.h"

@implementation typeCell

@synthesize m_nameLabel;
@synthesize m_typeImg;
@synthesize m_typeNameImg;
@synthesize m_glassCtrl;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
		self.m_typeImg = nil;
		self.m_typeImg = nil;
		self.m_glassCtrl = nil;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
	
	[m_glassCtrl release];
	[m_nameLabel release];
	[m_typeImg release];
	[m_typeNameImg release];
	
    [super dealloc];
}

- (void)setInfo:(NSInteger)profileNo{
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	profile* p = [gs.m_friendLists objectAtIndex:profileNo];

	NSString* str = [[NSString alloc] initWithFormat:@"%@", p.m_name];
	m_nameLabel.text = str;
	[str release];
	
	NSInteger type = [p getType];
	
	NSString* typeStr;
	NSString* typeNameStr;
	BOOL bMan = [p isMan];
	if ( bMan ) {
		typeStr = [[NSString alloc] initWithFormat:@"micon_%d", type];
		typeNameStr = [[NSString alloc] initWithFormat:@"micon_%d_text", type];
	}
	else {
		typeStr = [[NSString alloc] initWithFormat:@"wicon_%d", type];
		typeNameStr = [[NSString alloc] initWithFormat:@"wicon_%d_text", type];
	}
	
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:typeStr ofType:@"png"]];
	UIImageView* ti = [[UIImageView alloc] initWithImage:img];
	self.m_typeImg = ti;
	[ti release];
	[img release];
	[typeStr release];
	
	m_typeImg.frame = CGRectMake( 9, 9, 73, 60);
	[self addSubview:m_typeImg];

	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:typeNameStr ofType:@"png"]];
	ti = [[UIImageView alloc] initWithImage:img];
	self.m_typeNameImg = ti;
	[ti release];
	[img release];
	[typeNameStr release];
	
	m_typeNameImg.frame = CGRectMake( 82, 39, 140, 30);
	[self addSubview:m_typeNameImg];
	
	myGlassController* mg = [[myGlassController alloc] initWithNibName:@"myGlassController" bundle:[NSBundle mainBundle]];
	self.m_glassCtrl = mg;
	[mg release];
	
	m_glassCtrl.view.frame = CGRectMake( 213, 3, 64, 64 );
	[self addSubview:[m_glassCtrl view]];
	[m_glassCtrl setInfo:[p isMan] color:0 data:p.m_quesLists type:0 left:[p isMan]];
	
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
	
	[super setEditing:editing animated:animated];
	
	m_glassCtrl.view.hidden = editing;

	CGRect frame = m_typeImg.frame;
	
	if ( editing ) {

		frame = CGRectMake( 39, 9, frame.size.width, frame.size.height);
		m_typeImg.frame = frame;
	}
	else {
		
		frame = CGRectMake( 9, 9, frame.size.width, frame.size.height);
		m_typeImg.frame = frame;
	}
}

@end
