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
CCLabelTTF *frenzy;
CCLabelTTF *timeattack;
CCLabelTTF *catchme;




@implementation GameMode
-(id) init
{
	if ((self = [super init]))
	{
        frenzy = [CCLabelTTF labelWithString:@"Frenzy" fontName:@"Arial" fontSize:32];
        frenzy.position = ccp(160,320);
        frenzy.color = ccRED;
        [self addChild:frenzy];
        
        
        timeattack = [CCLabelTTF labelWithString:@"TimeAttack" fontName:@"Arial" fontSize:32];
        timeattack.position = ccp(160,250);
        timeattack.color = ccORANGE;
        [self addChild:timeattack];
        
        
        catchme = [CCLabelTTF labelWithString:@"CatchMe" fontName:@"Arial" fontSize:32];
        catchme.color = ccBLUE;
        catchme.position = ccp(160,160);
        [self addChild:catchme];
    
        
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
    
    
    }

@end