//
//  help.m
//  TapIt-02
//
//  Created by Tolga Beser on 6/6/14.
//
//

#import "help.h"
#import "GameMode.h"
CCLabelTTF *back;
CCLabelTTF *timeHelp;
CCLabelTTF *frenzyHelp;
CCLabelTTF *timeDes;
CCLabelTTF *frenzyDes;



@implementation help
-(id) init
{
	if ((self = [super init]))
	{
        back = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:20];
        back.position = ccp(50, 500);
        back.color = ccYELLOW;
        [self addChild:back];
        
        timeHelp = [CCLabelTTF labelWithString:@"Timeattack" fontName:@"chalkDuster" fontSize:30];
        timeHelp.position = ccp(160, 420);
        timeHelp.color = ccRED;
        [self addChild:timeHelp];
        
        timeDes = [CCLabelTTF labelWithString:@"In Timeattack your goal is to get the amount of taps needed to pass the level." fontName:@"Arial" fontSize:15 dimensions:CGSizeMake(300,75) hAlignment:kCCTextAlignmentCenter  lineBreakMode:kCCLineBreakModeWordWrap];
        timeDes.position = ccp(160,350);
        timeDes.color = ccRED;
        [self addChild:timeDes];
        
        frenzyHelp = [CCLabelTTF labelWithString:@"Frenzy" fontName:@"chalkDuster" fontSize:30];
        frenzyHelp.position = ccp(160, 250);
        frenzyHelp.color = ccYELLOW;
        [self addChild:frenzyHelp];
        
        
        frenzyDes = [CCLabelTTF labelWithString:@"In Frenzy your goal is to get as many taps as possible in 10 seconds." fontName:@"Arial" fontSize:15 dimensions:CGSizeMake(300,75) hAlignment:kCCTextAlignmentCenter  lineBreakMode:kCCLineBreakModeWordWrap];
        frenzyDes.position = ccp(160, 200);
        frenzyDes.color = ccYELLOW;
        [self addChild:frenzyDes];
        
        
        
        
        
        
        [self scheduleUpdate];
        
        
        
    }
    
	return self;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    help *layer = [help node];
    
    [scene addChild: layer];
    
    return scene;
}



-(void) update:(ccTime)delta
{
    KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:back touchPhase:KKTouchPhaseBegan ])
    {
          [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];
    }
   
}

@end
