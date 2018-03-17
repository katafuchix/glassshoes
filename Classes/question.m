//
//  question.m
//  glassshoes
//
//  Created by james Lee on 11/08/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "question.h"


@implementation question

- (id)init:(NSInteger)quesNo{

	m_nQuesNo = quesNo;
	
	//srand( time(nil) );
	NSInteger place = rand()%24;
	
	NSInteger chk = place/2;
	
	//NSLog( @" place = %d, chk = %d", place, chk );
	m_nAnswerA = (place/6+1);
	
	if( chk == 3 || chk == 6 || chk == 9 )
		m_nAnswerB = 1;
	else if( chk == 0 || chk == 7 || chk == 10 )
		m_nAnswerB = 2;
	else if( chk == 1 || chk == 4 || chk == 11 )
		m_nAnswerB = 3;
	else
		m_nAnswerB = 4;

	if ( place == 8 || place == 10 || place == 14 || place == 16 || place == 20 || place == 22 )
		m_nAnswerC = 1;
	else if ( place == 2 || place == 4 || place == 12 || place == 17 || place == 18 || place == 23 )
		m_nAnswerC = 2;
	else if ( place == 0 || place == 5 || place == 6 || place == 11 || place == 19 || place == 21 )
		m_nAnswerC = 3;
	else
		m_nAnswerC = 4;

	if ( place == 9 || place == 11 || place == 15 || place == 17 || place == 21 || place == 23 )
		m_nAnswerD = 1;
	else if ( place == 3 || place == 5 || place == 13 || place == 16 || place == 19 || place == 22 )
		m_nAnswerD = 2;
	else if ( place == 1 || place == 4 || place == 7 || place == 10 || place == 18 || place == 20 )
		m_nAnswerD = 3;
	else
		m_nAnswerD = 4;
	
	return self;
}

- (id)init2:(NSInteger)quesNo a1:(NSInteger)a1 a2:(NSInteger)a2 a3:(NSInteger)a3 a4:(NSInteger)a4 sel:(NSInteger)sel{

	m_nQuesNo = quesNo;
	m_nAnswerA = a1;
	m_nAnswerB = a2;
	m_nAnswerC = a3;
	m_nAnswerD = a4;
	m_nSelAnswer = sel;
	
	return self;
}

- (void)setAnswer:(NSInteger)sel{

	m_nSelAnswer = sel;
}

- (NSInteger)getQuizNo{
	
	return m_nQuesNo;
}

- (NSInteger)getAnswer:(NSInteger)place{

	if ( place == 0 )
		return m_nAnswerA;
	else if ( place == 1 )
		return m_nAnswerB;
	else if ( place == 2 )
		return m_nAnswerC;
	
	return m_nAnswerD;
}

- (NSInteger)getTheSel{

	return m_nSelAnswer;
}

- (NSInteger)getSelAnswer{

	if ( m_nSelAnswer == 0 )
		return m_nAnswerA;
	else if ( m_nSelAnswer == 1 )
		return m_nAnswerB;
	else if ( m_nSelAnswer == 2 )
		return m_nAnswerC;
	
	return m_nAnswerD;
}

- (BOOL)isSingleGyaku{

	if( m_nQuesNo == 5 || m_nQuesNo == 8 || m_nQuesNo == 12 || m_nQuesNo == 13 || m_nQuesNo == 19 )
		return true;
	
	return false;
}

- (BOOL)isMutiGyaku{

	//NSLog( @"isMutiGyaku = %d", m_nQuesNo );
	
	if( m_nQuesNo == 5 || m_nQuesNo == 7 || m_nQuesNo == 9 )
		return true;
	
	return false;
}

@end
