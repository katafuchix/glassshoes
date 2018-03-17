//
//  aboutType.m
//  glassshoes
//
//  Created by james Lee on 11/08/04.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "aboutType.h"
#import "glassshoesAppDelegate.h"
#import "myGPSController.h"
#import "glassShoes.h"
#import "profile.h"
#import "chkResultController.h"
#import "profileController.h"

@implementation aboutType

@synthesize m_parent;
@synthesize m_bkImg;
@synthesize m_backBtn;
@synthesize m_typeImg;
@synthesize m_infoImg;
@synthesize m_scrollView;
@synthesize m_infoLabel;
@synthesize m_cursorImg;
@synthesize m_tabBar;
@synthesize m_top;
@synthesize m_profile;
@synthesize m_history;
@synthesize m_search;
@synthesize m_setting;
@synthesize m_badgeImg;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		self.m_badgeImg = nil;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

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
	
	if ( m_badgeImg != nil ) {
		
		[m_badgeImg removeFromSuperview];
		[m_badgeImg release];
		m_badgeImg = nil;
	}
	
	[m_backBtn release];
	[m_typeImg release];	
	[m_infoImg release];	
	
	[m_bkImg release]; 
	[m_scrollView release];
	[m_infoLabel release];
	[m_cursorImg release];
	[m_tabBar release];
	[m_top release];
	[m_profile release];
	[m_search release];
	[m_history release];
	[m_setting release];
	
    [super dealloc];
}

-(void)setInfo:(id)oya profile:(NSInteger)profileNo from:(BOOL)bFit{
	
	m_parent = oya;
	m_profileNo = profileNo;
	m_bFromFit = bFit;
	m_mode = 0;
	
	[m_scrollView setClipsToBounds:YES];
	
	glassShoes *gs = [glassShoes sharedInstance];
	
	NSInteger type;
	BOOL bMan;
	if ( profileNo == -1 ) {
		
		type = [gs checkSingleType];
		bMan = [gs isMan];
	}
	else {
		profile* p;
		if ( profileNo == 0 ) {
			
			p = gs.m_myProfile;
		}
		else {
			p = [gs.m_friendLists objectAtIndex:(profileNo-1)];
		}
		
		type = [p getType];
		bMan = [p isMan];
	}

	
	NSString* typeStr;
	NSString* infoStr;
	if ( bMan ) {
		typeStr = [[NSString alloc] initWithFormat:@"man%d", type];
		infoStr = [[NSString alloc] initWithFormat:@"type_man%d", type];
	}
	else {
		typeStr = [[NSString alloc] initWithFormat:@"woman%d", type];
		infoStr = [[NSString alloc] initWithFormat:@"type_woman%d", type];
	}
	
	UIImage* img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:typeStr ofType:@"png"]];
	UIImageView* ti = [[UIImageView alloc] initWithImage:img];
	self.m_typeImg = ti;
	[ti release];
	[img release];
	[typeStr release];
	
	m_typeImg.frame = CGRectMake( 70, 45, 235, 159);
	[self.view addSubview:m_typeImg];

	img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:infoStr ofType:@"png"]];
	UIImageView* ii = [[UIImageView alloc] initWithImage:img];
	self.m_infoImg = ii;
	[ii release];
	[img release];
	[infoStr release];
	
	m_infoImg.frame = CGRectMake( 15, 55, 288, 139);
	[self.view addSubview:m_infoImg];
	
	NSInteger cx = 280;
	NSString* str = [self getTypeInfo:type];
	
	// 文字列描画に使用するフォント
	//UIFont *font = [UIFont systemFontOfSize:19];
	UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:19];
	NSInteger one_h = [self getTextsHeight:@"あ" cx:cx font:font];
	NSInteger h = [self getTextsHeight:str cx:cx font:font];
	
	m_infoLabel.text = str;
	m_infoLabel.numberOfLines = h/one_h;
	m_infoLabel.frame = CGRectMake( 0, 0, cx, h);
	
	m_maxY = 180- h;
	m_cnt = 0;
	[NSTimer scheduledTimerWithTimeInterval:1.0
									 target:self
								   selector:@selector(startTimeOut:)
								   userInfo:nil
									repeats:NO];
	[self showBadge];
}

-(void)showBadge{
	
	if ( m_badgeImg != nil ) {
		
		[m_badgeImg removeFromSuperview];
		[m_badgeImg release];
		m_badgeImg = nil;
	}
	
	glassShoes *gs = [glassShoes sharedInstance];
	NSInteger nBadge = [gs getBadge];
	
	if ( nBadge > 99 ) {
		nBadge = 99;
	}
	
	if( nBadge > 0 ){
		
		CGRect rect;
		if ( nBadge > 9 ) {
			
			rect = CGRectMake(164, 431, 28, 23);
		}
		else {
			
			rect = CGRectMake(168, 431, 23, 23);
		}
		
		NSString* name = [[NSString alloc] initWithFormat:@"b%d", nBadge];
		NSString *path= [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
		UIImage* img= [[UIImage alloc] initWithContentsOfFile:path];
		[name release];
		
		UIImageView* v = [[UIImageView alloc] initWithImage:img];
		self.m_badgeImg = v;
		[v release];
		
		[img release];
		[self.view addSubview:m_badgeImg];
		
		m_badgeImg.frame = rect;
	}
}


-(void)startTimeOut:( NSTimer *)aTimer{
	
	CGPoint origin = m_infoLabel.frame.origin;
	
	if( origin.y > m_maxY ){
		
		if ( m_cursorImg.hidden == YES ) {
			m_cursorImg.hidden = NO;
		}
		else {
			m_cursorImg.hidden = YES;
		}
	}
	
	m_cnt++;
	if ( m_cnt == 10 ) {
		
		if( origin.y > m_maxY ){
			
			m_cursorImg.hidden = NO;
		}
		else {
			m_cursorImg.hidden = YES;
		}
	}
	else{
		
		[NSTimer scheduledTimerWithTimeInterval:1.0
										 target:self
									   selector:@selector(startTimeOut:)
									   userInfo:nil
										repeats:NO];
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if( m_inMove )
		return;
	
    // Enumerates through all touch object
    for (UITouch *touch in touches){
		
		m_startPt = [touch locationInView:[self view]];
	}		
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if( m_inMove )
		return;
	
    // Enumerates through all touch object
    for (UITouch *touch in touches){
		
		CGPoint endPt = [touch locationInView:[self view]];
		
		if( CGRectContainsPoint(m_scrollView.frame, endPt ) ){
		
			if( CGRectContainsPoint(m_scrollView.frame, m_startPt ) ){
			
				CGPoint origin = m_infoLabel.frame.origin;
				CGSize size = m_infoLabel.frame.size;
				
				if ( m_startPt.y> endPt.y ) {
					
					origin.y -= abs(m_startPt.y- endPt.y);
					if( origin.y <= m_maxY ){
						origin.y = m_maxY;
						m_cursorImg.hidden = YES;
					}
					else if( m_cnt > 10 ){
						m_cursorImg.hidden = NO;
					}
				}
				else {
					
					origin.y += abs(m_startPt.y- endPt.y);
					if( origin.y > 0 )
						origin.y = 0;
					
					if( m_cnt > 10 ){
						m_cursorImg.hidden = NO;
					}
				}
				
				m_infoLabel.frame = CGRectMake( origin.x, origin.y, size.width, size.height);
				m_startPt = endPt;
			}
			else {
				
				m_startPt = endPt;
			}
		}
	}		
}

- (void)moveEnded{
	
	m_inMove = false;
}

// type 0 : A2 B2 C2 D2 才能みなぎる「宮廷音楽家」
// type 1 : A2 B2 C2 D1 使命感あふれる「医者」
// type 2 : A2 B2 C1 D2 聡明な「預言者」
// type 3 : A2 B2 C1 D1 頭のきれる「参謀」
// type 4 : A2 B1 C2 D2 温厚な「宮廷料理人」
// type 5 : A2 B1 C2 D1 誇り高き「騎士団長」
// type 6 : A2 B1 C1 D2 孤高の「サムライ」
// type 7 : A2 B1 C1 D1 厳しい教育係「ばあや」
// type 8 : A1 B2 C2 D2 好奇心の塊「発明家」
// type 9 : A1 B2 C2 D1 人の為に尽くす「シスター」
// type10 : A1 B2 C1 D2 熱意メラメラの「商人」
// type11 : A1 B2 C1 D1 生まれついての「国王」
// type12 : A1 B1 C2 D2 陽気な「吟遊詩人」
// type13 : A1 B1 C2 D1 気立てのいい「貴族」
// type14 : A1 B1 C1 D2 人生を楽しむ「海賊」
// type15 : A1 B1 C1 D1 頼りになる「大臣」
- (NSString*)getTypeInfo:(NSInteger)type{
	
	NSString* str;
	
	// type 0 : A2 B2 C2 D2 才能みなぎる「宮廷音楽家」
	if ( type == 0 ) {
		
		str = @"アンタは\r人生の意味を探求して、\r心の平和を求めて生きる人。\r自分自身の価値観で\r物事を判断し、\r自分が正しくないと思う\rことはやらない。\r世の中の流行などに\rあまり左右されずに、\r自分が良いと思ったこと\rだけを淡々とやる・・・\r良く言えば\r“違いのわかる人間”。\r悪く言えば“変人”ね。\r\r世話好きで、\r心を開いた相手のことを\r思いやるけど、\rその“心”を開く相手を\rすごく慎重に選ぶから、\rアンタを知らない他人には、\r冷たい人間に見られる時も\rあるみたいよ。損な人ね。\r数少ない信頼できる人には、\r誠意を尽くして\r付き合うタイプ。\r\r人間関係を\r客観視するのが苦手で、\r喧嘩しても、\r相手に立ち向かうよりかは、\rずっと怒りを\r引きずったままで、\rどうしていいのか分からずに\r付き合いをフェードアウト\rしちゃうことがあるわ。\r\rそんなアンタを好きに\rなってくれた恋人のことは、\rアンタなりの愛し方で\r全力投球する。\rただし、恋人と喧嘩しても\r直接相手と向き合わない。\r罪の意識を感じると、\r相手より自分を責める。\r何も言わないから、\r相手からすれば\rワケがわからない。\rウジウジしすぎなのよ！\r自分のことばかり考えずに、\r相手の身になって\r考えることを覚えなさい。";
	}
	// type 1 : A2 B2 C2 D1 使命感あふれる「医者」
	else if ( type == 1 ) {
		
		str = @"アンタは\r自分の才能を使って、\r人の役に立てることが\r生き甲斐なんだね。\rやさしくて控え目で、\rみんなを幸せにする\r縁の下の力持ちになりたい\rって思ってる。\r\rけど、あんたは強～い、\r自分の価値観を持っていて、\rゆるぎない自信を\r持っているから、\rもし批判されても引かない。\r上司だろうが権力だろうが、\r間違った事とは徹底的に戦う\r一面があるってこと。\r時にカリスマ性のある\rリーダーみたいになるわ。\r教祖みたいにね。その分、\r異なる意見を批判したり、\r軽蔑したりする\r頑固な一面も。あと、\r他人の発言にとても敏感。\r相手がそんなに意味もなく\r発言したことでも、\r感情的に捉えて\rカッとなることがある。\r\r恋人に対しては、\r相手が夢を実現できるように\r支えるけど、価値観だけは\r絶対にゆずらない。\r例えば、恋人の夢が\rアンタにとって\r理解できないモノなら、\r断固として\r反対を続けるわね。\rちょっと頑固すぎるわ。\r他人の考え方も\r理解をしようとする\r努力を知りなさい。\rあと、\r真面目すぎるのも良くない。\r人生、\r肩の力を抜くことも大事よ！";
	}
	// type 2 : A2 B2 C1 D2 聡明な「預言者」
	else if ( type == 2 ) {
		
		str = @"アンタ、\rパズルとか好きでしょ？\r複雑な問題を頭の中で\rこねくり回して考えるのが\r好きなタイプね。\r考えてから物事の裏の裏を\r見透かして、\r将来を予測するのが得意。\r誰も解決できない\rトラブルを、見事に\r解決しちゃうこともあるわ。\r頭が良くて\r色々なことに気が回るから、\rそうじゃない他人が\r大嫌いね。\rそんな相手を切り捨てたり、\r容赦なくダメ出しする\rイヤ〜な面もあるわ。\r\rそして、\rかなりの恋愛下手ね。\r自分自身の感情にまで\r気がつかないことも\rあるでしょ？\r好きな相手にも自分の感情を\r隠しちゃうから、\r本心が伝わらない。\r大事なことは\rちゃんと口にして、ちゃんと\r自分の気持ちを伝えること！\r\r仕事に没頭しちゃって、\r恋人をないがしろにしたりも\rするわね。あまり\r干渉されたくないのか、\r恋人にも個人主義な面を\rバリバリ見せるから。\r相手は寂しくなっちゃうわ。\rそんなアンタを\r理解してくれる相手が\rいればいいけど、\rどうかしらね？\r頑張って探しなさい。";
	}
	// type 3 : A2 B2 C1 D1 頭のきれる「参謀」
	else if ( type == 3 ) {
		
		str = @"アンタは、とても独創的で\r創意工夫に富んだ\rアイデアマン。\r家庭でも仕事のことでも、\r何か問題があれば、\rどうすれば改善できるかを\r考える。\r\r自分を\r向上させるのが好きで、\r勉強熱心でもある。\rいつも情報収集しているわ。\r「知識」と「発想」の両方で\r問題を解決する\r完璧主義者ね。ただ、\rアイデアに没頭しすぎて\r柱にぶつかったり、\rシャツのボタンを\rつけ間違うことも・・・\rボケボケな一面もあるって\rことね。そういうとこが\r魅力だったりするわ。\r\r知的で論理的な思考は得意\rだけど、人の気持ちのことは\r苦手でしょ？恋人にも感情を\r表現しないし、口にしない\rから、相手からすれば\r何を考えているのか、\rまったく分からない。\rそもそも、恋人には\r尽くしてもらって当たり前と\r思ってる面がある。\r言ってみれば、\rただのワガママ野郎よ。\rまずは相手を褒める\rってことから始めたら？\rちょっとは\rイタリア人を見習いなさい！";
	}
	// type 4 : A2 B1 C2 D2 温厚な「宮廷料理人」
	else if ( type == 4 ) {
		
		str = @"アンタは、地に足のついた\r安定した人間。\r控えめで謙虚でしょ。\r口数は少ないけど、人を\r喜ばせたいと思っている。\r不器用な奴だね。\r信頼している友人にしか\r胸の内を明かさず、\r信頼する人を\rよく吟味して選ぶね。\rあと、忍耐強いのも特徴。\rたいがいの事では\rキレないし、\r他人の悪口も言わないね。\r\r観察眼が鋭くて、\r他人の気持ちを\rすぐに察する。\r動物の気持ちまで\r察しちゃうぐらいだよ。\rだれも気がつかないような、\r人の気持ちに気がつくから、\rそのぶん他人の気持ちを\r察しすぎて、いつも自分が\r控えめになりがちだね。\r\r恋人とは、深く親密な\r信頼関係を築こうとする。\rだからこそ、\r相手のことを考えすぎて、\r自分の内面に\rストレスを溜めこんじゃう\rことが多いね。\r優しすぎよ、アンタは。\rその優しさが命取りに\rなることもあるのよ。\r我慢して、我慢して\r溜まりすぎたストレスが、\rいつか噴火して\rブチ切れちゃうなんてことも\rあるわ。たまには喧嘩して、\r言いたいことを\rぶちまけなさい！";
	}
	// type 5 : A2 B1 C2 D1 誇り高き「騎士団長」
	else if ( type == 5 ) {
		
		str = @"アンタは\r「組織の一員」として、\r誇りを持って活躍したい\rという欲求を持っている。\r\r新しい何かを創りだしたり、\r企画をするよりかは、\rこれまでの\r自分の経験から得た、\r確実な知識を使って\r物事をやり遂げるのが得意。\r“たたき上げタイプ”って\rとこね。\r\r人間関係では、\r何よりも仲間や恋人との\r対立を避けたがる。\r家族や、特に恋人には、\r忠誠を誓ったように尽くし、\r相手の欲求を\r優先してしまいがち。\rだから超ワガママな相手でも\r許しちゃうんでしょ。\r献身的につくしすぎて、\r相手にとって、それが\r当たり前になってくると、\r感謝されない。そうすると\r心身共に疲れちゃって、\r気持ちが離れていく。\rその繰り返しね。\rそんなんじゃ\r幸せになれないよ！\r\r相手に献身的に尽くして\r奴隷になることが\r「愛」じゃないわ。\r自分を磨いて、相手にとって\r無くてはならない存在に\rなることも忘れずに。";
	}
	// type 6 : A2 B1 C1 D2 孤高の「サムライ」
	else if ( type == 6 ) {
		
		str = @"アンタは本当に一匹狼。\r自分のことは\r自分で決めたいし、\rひとりで行動するか、\r少数の有能な人と\r一緒にいることを好む。\r他人からすると、ちょっと\rよそよそしく\r見られちゃうようね。\r親しい友人にも自分のことは\rあまり話さないからよ。\r\rそれに、\rアドレナリンが\r分泌するような危険なことが\r大好き。賭け事とか、\r車をぶっ飛ばすこと、\r激しいスポーツが\r好きじゃない？それから、\r突発的な問題が発生しても、\rすさまじい集中力で\r冷静にクリアする力が\rあるわね。\r\r人間関係では、\r他人にあまり関心がない。\r干渉されるのも嫌でしょ？\r\r恋人にも、好きなことを\rやらせてもらえる相手なら\r満足って思ってるね。\r好き勝手しても自分に\rついてきてくれる相手なら\rＯＫなんでしょうよ。\r恋人への支配欲も\r少ない方だから、\r相手が好き勝手やっても\r問題なし。\rアンタに言うことはないわ。\rひとりで勝手に生きなさい！";
	}
	// type 7 : A2 B1 C1 D1 厳しい教育係「ばあや」
	else if ( type == 7 ) {
		
		str = @"アンタはめったに\r冗談やお世辞を言わないね。\r遊びよりも\r仕事を優先するタイプ。\r細かく丁寧な仕事をするね。\r\r物静かだし、\r基本は一人でいるのが好き。\r目の前の事をこなす集中力は\rもの凄いけど、\r将来に向かって\r何かをする気が\rあまりないみたいだね。\r\rものすごく常識人で、\r人の道に反したことは\rしたくない。公正だけど、\r他人から感情的に何かを\r訴えられても、\r一切受け入れない、\r厳し～い一面があるね。\rそんな自分が有能だと\r自負してるところも\rあるようだけど、\r非情な人とも思われてるわ。\r\r周りの人間に\r気を配らないから、\rお高くとまっていると\r思われているわよ。\r本当は感情表現が\r苦手なだけなのにね。\r恋人にも愛情や好意を\r口にするのが苦手。\r「ことば〜にできな〜い♪」\rなんて\r歌ってる場合じゃないわ。\rちゃんと言葉にして\r表現しなさい。\r\rじゃないと、\rアンタは真面目に\r恋人に尽くしてても、\r相手は物足りなくなって\r浮気するわよ！";
	}
	// type 8 : A1 B2 C2 D2 好奇心の塊「発明家」
	else if ( type == 8 ) {
		
		str = @"アンタは飽くことを知らぬ\r好奇心の持ち主。\r色々なことに関心を持って、\rそれを他人と共有することで\r幸せを感じるタイプよ。\r「自分に不可能はない」って\r思っていて、\rそれを証明するために\rあらゆる発想をするわ。\r\r自分が\rユニークな存在であることを\r誇らしく思っていて、\r型にはまらず、\r時に権力やルールに\r従わないこともあるでしょ？\r発想力だけで\r生きてるような人間で、\r自分のアイデアは限界がなく\r沸き出ると思ってるわ。\rアイデアを発想することは\r得意だけど、\rそれを実現するための\r細かいことは結構苦手。\r\r恋人には、\rフィーリングの合う\rソウルメイトを選ぶわね。\r自分の思ってることを\r理解して、「うんうん」って\rうなずいたり、\r素直に驚いたりしてくれる\r相手を選ぶ。\rそんな相手を\r全身全霊で愛して、\r同志みたいに信頼する。\r\rけど、\rいったん関係がこじれたり、\r失望させられたりすると、\r自分の殻に閉じこもって\r悲観的になったり、孤独感に\r襲われたりする\r一面もあるわ。\r恋人が自分の興味を\r理解してくれなかったら、\rものすごく残念がる。\rアンタ、\r面白い人ぶってるけど、\r本当はネクラ野郎\rなんじゃないの！？";
	}
	// type 9 : A1 B2 C2 D1 人の為に尽くす「シスター」
	else if ( type == 9 ) {
		
		str = @"アンタは、\rなんでも人の為に動くことが\r大好きな野郎ね。\r“自分より他人”の人よ。\r人の気持ちを察して、\r他人同士の人間関係を\r円滑にする能力がある。\r人と人の架け橋になるのが\r幸せなんだね。\r\r人の気持ちに答えたくて、\r他人から頼られると\r思いっきり\r頑張っちゃうタイプ。\rだけど、人に\r苦しめられることも多い。\r裏切られたり、相手が自分に\r感謝の気持ちを\r持たなかったり。\r\r天使みたいな\r笑顔をしてるけど、\r実はその裏でいつも\r他人から“感謝”っていう\r見返りを期待してたりする。\rだからそれでよく\r被害妄想ぎみになったり\rすることが多いでしょ。\r\r恋愛面では、\r相手を優先しすぎて\r自分が損することが多いわ。\rそれに、“感謝”っていう\r見返りがないと、\rすごく傷つく。\rたまには自分の気持ちも\r優先してもいいんじゃない！\rあと、無理なことは\r無理って言うことも大事よ。\r無理なことを\r無理って言わないから、\rアンタはいつも\r苦しんでるんだから。";
	}
	// type10 : A1 B2 C1 D2 熱意メラメラの「商人」
	else if ( type == 10 ) {
		
		str = @"アンタは他人をノセるのが\r上手い人間ね。\r社交的で愛想がよく、\r誰とでも仲良くなれる。\r熱意を人に伝えるのが上手い\rから、交渉力と説得力は\rズバ抜けているわ！\r営業職や、起業するのに\r向いているタイプね。\r相手によって、\r発言することもしっかり\r変える戦略性もあるわ。\r\r人から好かれたい願望が\r強くて、\r人の輪の中心にいると\r気持ちがいいんでしょ？\rだからトークの展開も、\r色々考えるわね。\rちょっと難しいトークをした\rと思ったら、急に\rジョークを飛ばしたりして\r相手を楽しませる。\r天性のエンタティナーって\rとこね。\rペラペラと、よく\rそんなにしゃべれるわね。\r口から先に\r生まれてきたんじゃないの？\r\r恋愛面では、恋人を\r１人に絞るのが苦手で、\rできるだけ他の候補を\r残しておこうとする。\rその煮え切らない態度が、\r周りから見ると\r“信頼できない”って\r思われてるわよ！\rあと、口先だけの約束は\rやめなさい。\r行動が伴わないと、\rただの虚言癖よ。";
	}
	// type11 : A1 B2 C1 D1 生まれついての「国王」
	else if ( type == 11 ) {
		
		str = @"自分でも\r分かってるんでしょ？\rアンタは“王様”よ。\r熱意を持ってはっきりと\r意見を言うし、\r堂々としていて\r威圧的な存在感がある。\rすばやい決断もするし、\r大胆な発想も得意。\r集団を統率する\r素晴らしい才能があるわ。\r人からとても魅力的に\r見られているようね。\rそりゃそうよね、\r王様なんだから。\r\r頭もなかなかいいようね。\r将来を予測して、\rいつも戦略を練っている。\r論理的じゃないことが\r大嫌いで、他人にも\r論理的な発言を求めるわ。\r\r残念ながら\r恋人や他人の気持ちには、\r異常なほど\r鈍感なとこがあるわ。\r不器用な人間なのね。\r無愛想だったり、\r上からモノを言って\r怯えさせることもあるわね。\r人を褒めたりするのも苦手。\r演説とかは得意なのに、\r恋人に「愛してる」の一言も\r言えないタイプね。\r\rあと、仕事の方を優先して、\r恋愛をかえりみない\r傾向もある。他人からは\r魅力ある“王様”、\rだけど恋人には\rタダのつまらない野郎\rなんて最悪なパターンよ！\r恋人には、\r弱い自分も見せなさい。";
	}
	// type12 : A1 B1 C2 D2 陽気な「吟遊詩人」
	else if ( type == 12 ) {
		
		str = @"アンタ「バカっぽい」って\rよく言われない？\r「クヨクヨするな、\r楽しく行こう！」って\rいつも思ってるね。\r人のことを喜ばせたり、\r驚かせたりするのが大好き。\r人生で素朴な幸せを\r見つけるのがうまくて、\rいつも笑顔。\r他人への思いやりにも\r溢れているから、\rいつもおしゃべりしながら\r笑ってるね。\r人気物だから多忙で、\rよく遅刻したり、\r約束を忘れたりする。\rワタシはアンタの\rそういうとこ、好きだよ。\r\rけど、人の長所ばかり見て\r失望したり、人から\r騙されることも多いね。\rあと、\r他人から批判的な態度や、\r拒絶されると\r激しく傷つきまくるね。\r打たれ弱いんだよ。\r\r恋人には呑気で\r行きあたりばったりだけど、\r一生懸命に\r相手を支えようとする。\r対立するのが嫌だから、\r喧嘩しても\r話し合いを避ける。\rそういう所あるでしょ？\rいつも\r相手への思いやりの感情が、\r自分を抑制しちゃってるね。\r都合のいい相手に\rいつもなってない？\r冷静に自分を見て、\r気をつけるのよ！";
	}
	// type13 : A1 B1 C2 D1 気立てのいい「貴族」
	else if ( type == 13 ) {
		
		str = @"アンタは、窮地に陥ってる\r友人のところに\rまっ先に駆けつけるタイプ。\r愛想が良くて、情に厚い。\rまあ、真面目ないい奴だね、\r一般的には。\r友達が悩んでるって聞いたら\rすぐに駆けつけるし、\rボランティア活動するかも。\r社交的で、友達も多いし、\r人に好かれる\r才能を持ってる。\r\rだけど、\r他人に深く関わりすぎて、\r人間関係のトラブルに\r巻き込まれることも\r多いでしょ。ちょっと、\rお人好しすぎるんだよ！\rあと、お節介って思われてる\rこともあるようよ。\r人の事情にも、\rいちいち頭を突っ込みすぎ。\r\r恋人には、感情豊かに\r愛情を表現するタイプね。\r相手を喜ばせたいし、\r相手から愛されたい。\rそれはいいんだけど、\r相手にも同じことを\r強要するわね。自分が相手に\r苦しめられたと思ったら、\r長い付き合いでも\rすぐに関係を断っちゃう。\r\r一度裏切られた相手は\r許せないのね。でもそれは、\rちょっともったいないわ。\rアンタのただの誤解で、\r本当に大切な相手を\r失っているかもね。\r人間関係に、なんでも\r白黒つけたがるのは\rやめなさい。グレーなことも\r世の中にはあるのよ。";
	}
	// type14 : A1 B1 C1 D2 人生を楽しむ「海賊」
	else if ( type == 14 ) {
		
		str = @"アンタは、人生を\r冒険の連続だと思っていて、\r遊ぶのが大好き。\r知人が多くて、\rパーティーが大好きでしょ？\r\r何にでも首を突っ込む\r行動力があるけど、\rすぐに違うものに\r目移りする癖があるわね？\rそれに、後先考えず、\r自分の行動が\r人にどう影響を与えるのか\r考慮せずに行動する\r典型的な自己中心的人間ね。\r\r人と話していても、\r真剣な会話になると\r居心地が悪くなって、\rムードを明るくしようと\rクダラナイ事を言ったり。\r恋人が相手でも、\r誠意ある会話を長く続ける\r忍耐力がないから、\r話しに飽きて、\rうわついた会話が\r多くなっちゃう。\r\r相手からすると\r本心が分からないし、\r喧嘩の本当の理由も\rわからない。\r落ち着いてちゃんと相手に\r向き合いなさい！\r\r言っとくけど、\r人から“軽い”と\r思われてるのよアンタは。\rそんなんじゃ、\r相手もいつかはアンタに\r本当のことを\r何も言わなくなるわよ。";
	}
	// type15 : A1 B1 C1 D1 頼りになる「大臣」
	else if ( type == 15 ) {
		
		str = @"アンタは、\r組織や家族の“犬”だよ。\rふざけたことが嫌いで、\rジョークの通じない\rクソ真面目野郎な\r一面があるわ。\r絵に描いたような\r“生徒会長”タイプ。\r\rいつも、皆の先頭に立って、\r公正にルールや対策を\r決めるね。\r責任感があって\r人の顔色を見て\r行動を変えたり、\r金で動いたりしないタイプ。\r周りの人はそんなアンタに、\r厚い信頼を寄せているわ。\r\rただアンタは\r自分が決めたことを、\r他人が守らないのが\r我慢ならない。\rちょっと自分の価値観を\r他人に強要しすぎね！\r\r慣れ親しんだやり方や、\r昔ながらの方法を好むから、\r変化に対応するのも苦手。\r相手の意見も\r柔軟に取り入れられるように\r心がけなさい！\r\r恋愛面では、\r恋人をとっても大事にして、\rいい関係でいようと\r努力する。\rその反面、相手を完全に\rコントロールしたがる。\r支配欲が強すぎだね。\r欲が強すぎるのは、\r仕方ないわ。\rアンタは\r不安で不安で仕方ない\r小心者だからよ。\rいつか、\r相手を真に信頼する\r関係を築きなさい。";
	}
	
	return str;
}

-(IBAction)selToBack:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	m_mode = 5;
	
	if ( m_profileNo ) {
	
		chkResultController* oya = (chkResultController*)m_parent;
		[oya closeTypeHelpPage];
	}
	else {
		
		profileController* oya = (profileController*)m_parent;
		[oya closeTypeHelpPage];
	}
}

-(IBAction)selToTop:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( m_profileNo == -1 && [super isAsked] == false ) {
		
		[super showMoveConfPage:1];
		return;
	}
	
	m_mode = 6;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showStartPage];

	if ( m_profileNo == -1 ) {
		
		[appli.m_gpsCtrl closeChkResultPage];
	}
	else {

		[appli.m_gpsCtrl closeProfilePage];
	}
}

-(IBAction)selToProfile:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}

	if ( m_profileNo == -1 && [super isAsked] == false ) {
		
		[super showMoveConfPage:2];
		return;
	}
	
	m_mode = 7;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showProfileTopPage];
	
	if ( m_profileNo == -1 ) {
		
		[appli.m_gpsCtrl closeChkResultPage];
	}
	else {
		
		[appli.m_gpsCtrl closeProfilePage];
	}
}

-(IBAction)selToHistory:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( m_profileNo == -1 && [super isAsked] == false ) {
		
		[super showMoveConfPage:3];
		return;
	}
	
	m_mode = 8;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showHistoryPage];
	if ( m_profileNo == -1 ) {
		
		[appli.m_gpsCtrl closeChkResultPage];
	}
	else {
		
		[appli.m_gpsCtrl closeProfilePage];
	}
}

-(IBAction)selToSearch:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( m_profileNo == -1 && [super isAsked] == false ) {
		
		[super showMoveConfPage:4];
		return;
	}
	
	m_mode = 9;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSearchPage];
	if ( m_profileNo == -1 ) {
		
		[appli.m_gpsCtrl closeChkResultPage];
	}
	else {
		
		[appli.m_gpsCtrl closeProfilePage];
	}
}

-(IBAction)selToSetting:(id)sender{
	
	if ( m_mode != 0 ) {
		
		return;
	}
	
	if ( m_profileNo == -1 && [super isAsked] == false ) {
		
		[super showMoveConfPage:5];
		return;
	}
	
	m_mode = 10;
	
	glassshoesAppDelegate* appli = (glassshoesAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appli.m_gpsCtrl showSettingPage];
	if ( m_profileNo == -1 ) {
		
		[appli.m_gpsCtrl closeChkResultPage];
	}
	else {
		
		[appli.m_gpsCtrl closeProfilePage];
	}
}


- (NSInteger)getTextsHeight:(NSString*)str cx:(NSInteger)cx font:(UIFont*)font{
	
	// 最大の表示領域CGSize。このCGSize以上は文字列長がこのサイズを超える場合はすべて表示されない
	CGSize bounds = CGSizeMake(cx, 10000);
	
	// 表示に必要なCGSize
	CGSize size = [str sizeWithFont:font constrainedToSize:bounds lineBreakMode:UILineBreakModeTailTruncation];
	
	return size.height;
}

@end
