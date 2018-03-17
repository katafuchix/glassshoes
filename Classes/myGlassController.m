//
//  myGlassController.m
//  glassshoes
//
//  Created by james Lee on 11/08/12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "myGlassController.h"
#import "question.h"

@implementation myGlassController

@synthesize m_imgList;
@synthesize m_glassView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_imgList = nil;
    }
    return self;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	
	[self clearLists];
	
    [super dealloc];
}

- (void)clearLists{

	if( m_imgList != nil ){

		for ( int i= 0; i< [m_imgList count]; i++) {

			UIImageView* img = [m_imgList objectAtIndex:i];
			[img removeFromSuperview];
		}
		
		[m_imgList removeAllObjects];
		[m_imgList release];
		m_imgList = nil;
	}
	
}

- (UIImage*)makeMyGlass:(BOOL)bMan data:(NSMutableArray*)data left:(BOOL)bLeft{

	int i;
	NSInteger nPara[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	
	for ( i= 0; i < 20; i ++ ) {
		
		question* q = [data objectAtIndex:i];
		NSInteger quizNo = [q getQuizNo];//1-20
		NSInteger answerNo = [q getSelAnswer];//1-4

		if ( !bLeft && [q isSingleGyaku] ){
			
			nPara[quizNo-1] = 5- answerNo;
		}
		else {
			nPara[quizNo-1] = answerNo;
		}
	}
	
	UIImage* baseImg;
	UIImage* p1Img;
	UIImage* p2Img;
	UIImage* p3Img;
	UIImage* p4Img;
	UIImage* p5Img; 
	UIImage* p6Img;
	UIImage* p7Img;
	
	if ( bLeft ){// 青

		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"man_glass360" ofType:@"png"]];
		p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p1" ofType:@"png"]];
		p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p2" ofType:@"png"]];
		p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p3" ofType:@"png"]];
		p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p4" ofType:@"png"]];
		p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p5" ofType:@"png"]];
		p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p6" ofType:@"png"]];
		p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"p7" ofType:@"png"]];
		
		/*
		baseImg = [UIImage imageNamed:@"man_glass360.png"];
		p1Img = [UIImage imageNamed:@"p1.png"];
		p2Img = [UIImage imageNamed:@"p2.png"];
		p3Img = [UIImage imageNamed:@"p3.png"];
		p4Img = [UIImage imageNamed:@"p4.png"];
		p5Img = [UIImage imageNamed:@"p5.png"];
		p6Img = [UIImage imageNamed:@"p6.png"];
		p7Img = [UIImage imageNamed:@"p7.png"];
		*/ 
	}
	else{
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"woman_glass360" ofType:@"png"]];
		p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w1" ofType:@"png"]];
		p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w2" ofType:@"png"]];
		p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w3" ofType:@"png"]];
		p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w4" ofType:@"png"]];
		p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w5" ofType:@"png"]];
		p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w6" ofType:@"png"]];
		p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"w7" ofType:@"png"]];
		
		/*
		 baseImg = [UIImage imageNamed:@"woman_glass360.png"];
		 p1Img = [UIImage imageNamed:@"w1.png"];
		 p2Img = [UIImage imageNamed:@"w2.png"];
		 p3Img = [UIImage imageNamed:@"w3.png"];
		 p4Img = [UIImage imageNamed:@"w4.png"];
		 p5Img = [UIImage imageNamed:@"w5.png"];
		 p6Img = [UIImage imageNamed:@"w6.png"];
		 p7Img = [UIImage imageNamed:@"w7.png"];
		*/ 
	}
	
	UIGraphicsBeginImageContext(CGSizeMake(520, 520)); //縦の場合 

	for( i= 0; i< 20; i++ ){
		
		NSInteger answerNo = nPara[i];
		
		CGRect rect;
		
		if ( bMan ) {
			
			if ( bLeft )
				rect = CGRectMake( 0, i*GLASS_CY, GSSOLD_LX+answerNo*GLASS_CX, GLASS_CY ); 
			else
				//rect = CGRectMake( GSSOLD_LX+(4-answerNo)*GLASS_CX, i*GLASS_CY, GSSOLD_RX+answerNo*GLASS_CX, GLASS_CY ); 
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY, GSSOLD_RX+(4-answerNo)*GLASS_CX, GLASS_CY); 
		}
		else {
			
			if ( bLeft )
				rect = CGRectMake( 0, i*GLASS_CY, GSSOLD_LX+answerNo*GLASS_CX, GLASS_CY ); 
			//rect = CGRectMake( 0, i*GLASS_CY, GSSOLD_LX+(4-answerNo)*GLASS_CX, GLASS_CY); 
			else
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY, GSSOLD_RX+(4-answerNo)*GLASS_CX, GLASS_CY); 
		}
		
		CGImageRef cgImage = CGImageCreateWithImageInRect(baseImg.CGImage, rect); 
		UIImage* img = [UIImage imageWithCGImage:cgImage]; 
		CGImageRelease(cgImage); 
		
		[img drawInRect:rect];
		
		//NSLog( @"draw[%d] base (%f, %f, %f, %f)", i, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
	}
	
	NSInteger off = 12;
	for( i= 0; i< 20; i++ ){
		
		NSInteger answerNo = nPara[i];
		
		CGRect rect;
		if ( bLeft ){// 青
		
			if( i == 0 ){
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, 0, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
				//NSLog( @"draw1 img2 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else if ( answerNo > nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_CY, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
				//NSLog( @"draw2 img2 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				
				for ( int j= 0; j < ( answerNo - nPara[i-1]- 2); j++) {
					
					rect.origin.x -= GLASS_CX;
					[p1Img drawInRect:rect];
					//NSLog( @"draw3 img1 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				}
			}
			else if ( answerNo == nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX+108, i*GLASS_CY, 12, GLASS_CY/2 );
				[p3Img drawInRect:rect];
				//NSLog( @"draw4 img3 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX-off, i*GLASS_CY-off-1, GLASS_CX+off, GLASS_CY/2+off );
				[p7Img drawInRect:rect];
				//NSLog( @"draw5 img7 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			
			if( i == 19 ){
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
				//NSLog( @"draw6 img4 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else if ( answerNo > nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
				//NSLog( @"draw7 img4 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				
				for ( int j= 0; j < ( answerNo - nPara[i+1] -2); j++) {
					
					rect.origin.x -= GLASS_CX;
					[p5Img drawInRect:rect];
					//NSLog( @"draw8 img5 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				}
			}
			else if ( answerNo == nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX+108, i*GLASS_CY+GLASS_CY/2, 12, GLASS_CY/2 );
				[p3Img drawInRect:rect];
				//NSLog( @"draw9 img3 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX-off, i*GLASS_CY+GLASS_CY/2, GLASS_CX+off, GLASS_CY/2+off );
				[p6Img drawInRect:rect];
				//NSLog( @"draw10 img6 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
		}
		else {

			if( i == 0 ){
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, 0, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
				//NSLog( @"draw11 img2 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else if ( answerNo < nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
				//NSLog( @"draw12 img2 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				
				for ( int j= 0; j < ( nPara[i-1]- answerNo- 2); j++) {
					
					rect.origin.x += GLASS_CX;
					[p1Img drawInRect:rect];
					//NSLog( @"draw img1 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				}
			}
			else if ( answerNo == nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY, 12, GLASS_CY/2 );
				[p3Img drawInRect:rect];
				//NSLog( @"draw13 img3 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_CY-off-1, GLASS_CX+off, GLASS_CY/2+off );
				[p7Img drawInRect:rect];
				//NSLog( @"draw14 img7 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			
			if( i == 19 ){
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
				//NSLog( @"draw15 img4 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else if ( answerNo < nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
				//NSLog( @"draw16 img4 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				
				for ( int j= 0; j < ( nPara[i+1]- answerNo- 2); j++) {
					
					rect.origin.x += GLASS_CX;
					[p5Img drawInRect:rect];
					//NSLog( @"draw17 img5 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
				}
			}
			else if ( answerNo == nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_CY+GLASS_CY/2, 12, GLASS_CY/2 );
				[p3Img drawInRect:rect];
				//NSLog( @"draw18 img3 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX+off, GLASS_CY/2+off );
				[p6Img drawInRect:rect];
				//NSLog( @"draw19 img6 at (%f, %f, %f, %f)", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
			}
		}
	}		
	
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();  
	UIGraphicsEndImageContext(); 
	
	[baseImg release];
	[p1Img release];
	[p2Img release];
	[p3Img release];
	[p4Img release];
	[p5Img release]; 
	[p6Img release];
	[p7Img release];
	
	return newImage;
}

- (UIImage*)makeMutiGlass:(BOOL)bMan color:(NSInteger)color data:(NSMutableArray*)data left:(BOOL)bLeft{
	
	int i;
	NSInteger nPara[] = { 0, 0, 0, 0, 0 };
	
	for ( i= 0; i < 5; i ++ ) {
		
		question* q = [data objectAtIndex:i];
		NSInteger quizNo = ([q getQuizNo]-1)/2+ 1;
		NSInteger answerNo = [q getSelAnswer];//1-4
		
		//NSLog( @"q[%d] = %d: %d", i, quizNo, answerNo );
		
		if ( !bLeft && [q isMutiGyaku] ){
			
			nPara[quizNo-1] = 5- answerNo;
		}
		else {
			nPara[quizNo-1] = answerNo;
		}
	}
	
	//NSLog( @"muti glass = (%d, %d, %d, %d, %d)", nPara[0], nPara[1], nPara[2], nPara[3], nPara[4] );
	
	UIImage* baseImg;
	UIImage* p1Img;
	UIImage* p2Img;
	UIImage* p3Img;
	UIImage* p4Img;
	UIImage* p5Img; 
	UIImage* p6Img;
	UIImage* p7Img;
	
	if ( color == 0 ){// 紫
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_glass360" ofType:@"png"]];

		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p7" ofType:@"png"]];
		}
		else{

			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pure_p12" ofType:@"png"]];
		}
	}
	else if ( color == 1 ){// 赤
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_glass360" ofType:@"png"]];

		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"red_p12" ofType:@"png"]];
		}
	}
	else if ( color == 2 ){// オレンジ
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"orange_p12" ofType:@"png"]];
		}
	}
	else if ( color == 3 ){// 緑
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"green_p12" ofType:@"png"]];
		}
	}
	else if ( color == 4 ){// グレー
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gray_p12" ofType:@"png"]];
		}
	}
	else if ( color == 5 ){// 青
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"man_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blue_p12" ofType:@"png"]];
		}
	}
	else if ( color == 6 ){// 黄色
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_glass360" ofType:@"png"] ];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"yellow_p12" ofType:@"png"]];
		}
	}
	else if ( color == 7 ){// 茶色
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_glass360" ofType:@"png"] ];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tea_p12" ofType:@"png"]];
		}
	}
	else if ( color == 8 ){// 黒
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_glass360" ofType:@"png"] ];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"black_p12" ofType:@"png"]];
		}
	}
	else if ( color == 9 ){// 白
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"white_p12" ofType:@"png"]];
		}
	}
	else if ( color == 10 ){// 肌色
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"skin_p12" ofType:@"png"]];
		}
	}
	else if ( color == 11 ){// ピンク
		baseImg = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"woman_glass360" ofType:@"png"]];
		
		if ( bLeft ){
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p2" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p3" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p4" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p6" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p7" ofType:@"png"]];
		}
		else{
			
			p1Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p1" ofType:@"png"]];
			p2Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p8" ofType:@"png"]];
			p3Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p9" ofType:@"png"]];
			p4Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p10" ofType:@"png"]];
			p5Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p5" ofType:@"png"]];
			p6Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p11" ofType:@"png"]];
			p7Img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pink_p12" ofType:@"png"]];
		}
	}
	
	UIGraphicsBeginImageContext(CGSizeMake(520, 520)); //縦の場合 
	
	for( i= 0; i< 5; i++ ){
		
		NSInteger answerNo = nPara[i];
		
		CGRect rect;

		if ( bMan ) {
			
			if ( bLeft )
				rect = CGRectMake( 0, i*GLASS_MY, GSSOLD_LX+answerNo*GLASS_CX, GLASS_MY ); 
			else
				rect = CGRectMake( GSSOLD_LX+(4-answerNo)*GLASS_CX, i*GLASS_MY, GSSOLD_RX+answerNo*GLASS_CX, GLASS_MY ); 
		}
		else {

			if ( bLeft )
				rect = CGRectMake( 0, i*GLASS_MY, GSSOLD_LX+answerNo*GLASS_CX, GLASS_MY ); 
			else
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_MY, GSSOLD_RX+(4-answerNo)*GLASS_CX, GLASS_MY); 
		}
		
		CGImageRef cgImage = CGImageCreateWithImageInRect(baseImg.CGImage, rect); 
		UIImage* img = [UIImage imageWithCGImage:cgImage]; 
		CGImageRelease(cgImage); 
		
		[img drawInRect:rect];
		//NSLog( @"draw[%d] base (%f, %f, %f, %f)", i, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
	}
	
	NSInteger off = 12;
	for( i= 0; i< 5; i++ ){
		
		NSInteger answerNo = nPara[i];
		
		CGRect rect;
		
		if ( bLeft ){
			
			if( i == 0 ){
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, 0, GLASS_CX, GLASS_MY/2 );
				[p2Img drawInRect:rect];
			}
			else if ( answerNo > nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_MY, GLASS_CX, GLASS_MY/2 );
				[p2Img drawInRect:rect];
				
				for ( int j= 0; j < ( answerNo - nPara[i-1]- 1); j++) {
					
					rect.origin.x -= GLASS_CX;
					[p1Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX+108, i*GLASS_MY, 12, GLASS_MY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX-off, i*GLASS_MY-off, GLASS_CX+off, GLASS_MY/2+off );
				[p7Img drawInRect:rect];
			}
			
			if( i == 4 ){
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_MY+GLASS_MY/2, GLASS_CX, GLASS_MY/2 );
				[p4Img drawInRect:rect];
			}
			else if ( answerNo > nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_MY+GLASS_MY/2, GLASS_CX, GLASS_MY/2 );
				[p4Img drawInRect:rect];
				
				for ( int j= 0; j < ( answerNo - nPara[i+1] -1); j++) {
					
					rect.origin.x -= GLASS_CX;
					[p5Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX+108, i*GLASS_MY+GLASS_MY/2, 12, GLASS_MY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX-off, i*GLASS_MY+GLASS_MY/2, GLASS_CX+off, GLASS_MY/2+off );
				[p6Img drawInRect:rect];
			}
		}
		else {
			
			if( i == 0 ){
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, 0, GLASS_CX, GLASS_MY/2 );
				[p2Img drawInRect:rect];
			}
			else if ( answerNo < nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_MY, GLASS_CX, GLASS_MY/2 );
				[p2Img drawInRect:rect];
				
				for ( int j= 0; j < ( nPara[i-1]- answerNo- 2); j++) {
					
					rect.origin.x += GLASS_CX;
					[p1Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_MY, 12, GLASS_MY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_MY-off, GLASS_CX+off, GLASS_MY/2+off );
				[p7Img drawInRect:rect];
			}
			
			if( i == 4 ){
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_MY+GLASS_MY/2, GLASS_CX, GLASS_MY/2 );
				[p4Img drawInRect:rect];
			}
			else if ( answerNo < nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_MY+GLASS_MY/2, GLASS_CX, GLASS_MY/2 );
				[p4Img drawInRect:rect];
				
				for ( int j= 0; j < ( nPara[i+1]- answerNo- 2); j++) {
					
					rect.origin.x += GLASS_CX;
					[p5Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_LX+answerNo*GLASS_CX, i*GLASS_MY+GLASS_MY/2, 12, GLASS_MY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_LX+(answerNo-1)*GLASS_CX, i*GLASS_MY+GLASS_MY/2, GLASS_CX+off, GLASS_MY/2+off );
				[p6Img drawInRect:rect];
			}
		}
	}		
	
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();  
	UIGraphicsEndImageContext(); 
	
	[baseImg release];
	[p1Img release];
	[p2Img release];
	[p3Img release];
	[p4Img release];
	[p5Img release]; 
	[p6Img release];
	[p7Img release];
	
	return newImage;
}

/*
- (UIImage*)makeMyGlass:(BOOL)bMan data:(NSMutableArray*)data left:(BOOL)bLeft{
	
	int i;
	NSInteger nPara[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	
	for ( i= 0; i < 20; i ++ ) {
		
		question* q = [data objectAtIndex:i];
		NSInteger quizNo = [q getQuizNo];//1-20
		NSInteger answerNo = [q getSelAnswer];//1-4
		
		if ( !bMan && [q isSingleGyaku] ){
			
			nPara[quizNo-1] = 5- answerNo;
		}
		else {
			nPara[quizNo-1] = answerNo;
		}
	}
	
	UIImage* baseImg;
	UIImage* p1Img;
	UIImage* p2Img;
	UIImage* p3Img;
	UIImage* p4Img;
	UIImage* p5Img; 
	UIImage* p6Img;
	UIImage* p7Img;
	
	if ( bLeft ){// 青
		
		baseImg = [UIImage imageNamed:@"man_glass360.png"];
		p1Img = [UIImage imageNamed:@"p1.png"];
		p2Img = [UIImage imageNamed:@"p2.png"];
		p3Img = [UIImage imageNamed:@"p3.png"];
		p4Img = [UIImage imageNamed:@"p4.png"];
		p5Img = [UIImage imageNamed:@"p5.png"];
		p6Img = [UIImage imageNamed:@"p6.png"];
		p7Img = [UIImage imageNamed:@"p7.png"];
	}
	else{
		baseImg = [UIImage imageNamed:@"woman_glass360.png"];
		p1Img = [UIImage imageNamed:@"w1.png"];
		p2Img = [UIImage imageNamed:@"w2.png"];
		p3Img = [UIImage imageNamed:@"w3.png"];
		p4Img = [UIImage imageNamed:@"w4.png"];
		p5Img = [UIImage imageNamed:@"w5.png"];
		p6Img = [UIImage imageNamed:@"w6.png"];
		p7Img = [UIImage imageNamed:@"w7.png"];
	}
	
	UIGraphicsBeginImageContext(CGSizeMake(320, 320)); //縦の場合 
	
	for( i= 0; i< 20; i++ ){
		
		NSInteger answerNo = nPara[i];
		
		CGRect rect;
		
		if ( bMan ) {
			
			if ( bLeft )
				rect = CGRectMake( 0, i*GLASS_CY, GSSOLD_X+answerNo*GLASS_CX, GLASS_CY ); 
			else
				rect = CGRectMake( GSSOLD_X+(4-answerNo)*GLASS_CX, i*GLASS_CY, GSSOLD_X+answerNo*GLASS_CX, GLASS_CY ); 
		}
		else {
			
			if ( bLeft )
				rect = CGRectMake( 0, i*GLASS_CY, GSSOLD_X+(4-answerNo)*GLASS_CX, GLASS_CY); 
			else
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, i*GLASS_CY, GSSOLD_X+(4-answerNo)*GLASS_CX, GLASS_CY); 
		}
		
		CGImageRef cgImage = CGImageCreateWithImageInRect(baseImg.CGImage, rect); 
		UIImage* img = [UIImage imageWithCGImage:cgImage]; 
		CGImageRelease(cgImage); 
		
		[img drawInRect:rect];
		
		if ( bLeft ){// 青
			
			if( i == 0 ){
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, 0, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
			}
			else if ( answerNo > nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
				
				for ( int j= 0; j < ( answerNo - nPara[i-1]- 2); j++) {
					
					rect.origin.x -= GLASS_CX;
					[p1Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY, GLASS_CX, GLASS_CY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX-7, i*GLASS_CY-7, GLASS_CX+7, GLASS_CY/2+7 );
				[p7Img drawInRect:rect];
			}
			
			if( i == 19 ){
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
			}
			else if ( answerNo > nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
				
				for ( int j= 0; j < ( answerNo - nPara[i+1] -2); j++) {
					
					rect.origin.x -= GLASS_CX;
					[p5Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX-7, i*GLASS_CY+GLASS_CY/2, GLASS_CX+7, GLASS_CY/2+7 );
				[p6Img drawInRect:rect];
			}
		}
		else {
			
			if( i == 0 ){
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, 0, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
			}
			else if ( answerNo < nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, i*GLASS_CY, GLASS_CX, GLASS_CY/2 );
				[p2Img drawInRect:rect];
				
				for ( int j= 0; j < ( nPara[i-1]- answerNo- 2); j++) {
					
					rect.origin.x += GLASS_CX;
					[p1Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i-1] ) {
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, i*GLASS_CY, GLASS_CX, GLASS_CY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY-7, GLASS_CX+7, GLASS_CY/2+7 );
				[p7Img drawInRect:rect];
			}
			
			if( i == 19 ){
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
			}
			else if ( answerNo < nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p4Img drawInRect:rect];
				
				for ( int j= 0; j < ( nPara[i+1]- answerNo- 2); j++) {
					
					rect.origin.x += GLASS_CX;
					[p5Img drawInRect:rect];
				}
			}
			else if ( answerNo == nPara[i+1] ) {
				
				rect = CGRectMake( GSSOLD_X+answerNo*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX, GLASS_CY/2 );
				[p3Img drawInRect:rect];
			}
			else {
				
				rect = CGRectMake( GSSOLD_X+(answerNo-1)*GLASS_CX, i*GLASS_CY+GLASS_CY/2, GLASS_CX+7, GLASS_CY/2+7 );
				[p6Img drawInRect:rect];
			}
		}
	}		
	
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();  
	UIGraphicsEndImageContext(); 
	
	return newImage;
}
*/

// type = 0 : mini (24*24)
//		= 1 : normal (160*160)
//		= 2 : big (240*240)
//      = 3 : muti (160*160)
- (void)setInfo:(BOOL)bMan color:(NSInteger)color data:(NSMutableArray*)data type:(NSInteger)type left:(BOOL)bLeft{
	
	m_imgList = [[NSMutableArray alloc] init];

	if( type > 2 && type < 10 ){

		UIImage* img = [self makeMutiGlass:bMan color:color data:data left:bLeft];
		UIImageView* imgView = [[UIImageView alloc] initWithImage:img];
		self.m_glassView = imgView;
		[imgView release];
		
		if ( type == 3 ) {
			m_glassView.frame = CGRectMake( 0, 0, 120, 120 );
		}
		else if ( type == 4 ){
			m_glassView.frame = CGRectMake( 0, 0, 160, 160 );
		}
		else {
			m_glassView.frame = CGRectMake( 0, 0, 180, 180 );
		}
		
		[self.view addSubview:m_glassView];
	}
	else {

		UIImage* img = [self makeMyGlass:bMan data:data left:bLeft];
		UIImageView* imgView = [[UIImageView alloc] initWithImage:img];
		self.m_glassView = imgView;
		[imgView release];
		
		if ( type == 0 ) {
			m_glassView.frame = CGRectMake( 0, 0, 64, 64 );
		}
		else if ( type == 11 ){
			m_glassView.frame = CGRectMake( 0, 0, 180, 180 );
		}
		else if ( type == 12 ){
			m_glassView.frame = CGRectMake( 0, 0, 196, 196 );
		}
		else if ( type == 1 ){
			m_glassView.frame = CGRectMake( 0, 0, 160, 160 );
		}
		else {
			m_glassView.frame = CGRectMake( 0, 0, 120, 120 );
		}
		//m_glassView.alpha = 0.9;
		
		[self.view addSubview:m_glassView];
		//[img release];
	}
}

@end
