//
//  question.h
//  glassshoes
//
//  Created by james Lee on 11/08/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface question : NSObject {

	NSInteger m_nQuesNo;//1-20
	NSInteger m_nAnswerA;//1-4
	NSInteger m_nAnswerB;//1-4
	NSInteger m_nAnswerC;//1-4
	NSInteger m_nAnswerD;//1-4
	
	NSInteger m_nSelAnswer;//0-3
}

- (id)init:(NSInteger)quesNo;
- (id)init2:(NSInteger)quesNo a1:(NSInteger)a1 a2:(NSInteger)a2 a3:(NSInteger)a3 a4:(NSInteger)a4 sel:(NSInteger)sel;

- (void)setAnswer:(NSInteger)sel;

- (NSInteger)getQuizNo;

- (NSInteger)getAnswer:(NSInteger)place;

- (NSInteger)getTheSel;

- (NSInteger)getSelAnswer;

- (BOOL)isSingleGyaku;

- (BOOL)isMutiGyaku;

@end
