//
//  TGameMode.m
//  TapIt-02
//
//  Created by Tolga Beser on 5/3/14.
//
//

#import "Title.h"
#import "HelloWorldLayer.h"
#import "GameMode.h"
#import "timeAttack.h"
#import "help.h"
CCLabelTTF *frenzy;
CCLabelTTF *timeattack;
CCLabelTTF *catchme;
CCLabelTTF *helper;




@implementation GameMode
-(id) init
{
	if ((self = [super init]))
	{
        frenzy = [CCLabelTTF labelWithString:@"Frenzy" fontName:@"Chalkduster" fontSize:40];
        frenzy.position = ccp(160,350);
        frenzy.color = ccRED;
        [self addChild:frenzy];
        
        
        timeattack = [CCLabelTTF labelWithString:@"TimeAttack" fontName:@"Chalkduster" fontSize:40];
        timeattack.position = ccp(160,270);
        timeattack.color = ccYELLOW;
        [self addChild:timeattack];
        
        helper = [CCLabelTTF labelWithString:@"Help" fontName:@"Arial" fontSize:20];
        helper.position = ccp(250, 500);
        helper.color = ccGREEN;
        [self addChild:helper];
        
      
    
        
        [self scheduleUpdate];
    }
    
	return self;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    GameMode *layer = [GameMode node];
    
    [scene addChild: layer];
    
    return scene;
}



-(void) update:(ccTime)delta
{
    KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:frenzy touchPhase:KKTouchPhaseBegan])
        
    {
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[HelloWorldLayer alloc] init]];
        NSLog(@"Frenzy Button Pressed");
    }
    
    if ([input isAnyTouchOnNode:timeattack touchPhase:KKTouchPhaseBegan])
    {
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[timeAttack alloc] init]];
        NSLog(@"Timeattack Button Pressed");
    }
    if ([input isAnyTouchOnNode:helper touchPhase:KKTouchPhaseBegan]) {
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[help alloc] init]];    }
    
    }

@end