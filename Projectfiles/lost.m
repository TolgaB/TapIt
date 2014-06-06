//
//  lost.m
//  TapIt-02
//
//  Created by Tolga Beser on 6/4/14.
//
//

#import "lost.h"
#import "GameMode.h"
#import "timeAttack.h"
CCLabelTTF *youlose;
CCLabelTTF *back;
CCLabelTTF *retryTime;
@implementation lost

-(id) init
{
	if ((self = [super init]))
	{
        
        youlose =[CCLabelTTF labelWithString:@"Better Luck Next Time" fontName:@"Arial" fontSize:28];
        youlose.position = ccp(160, 320);
        youlose.color = ccBLUE;
        [self addChild:youlose];
        
        back = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:24];
        back.position = ccp(160, 50);
        back.color = ccRED;
        [self addChild:back];
        
        retryTime = [CCLabelTTF labelWithString:@"Retry" fontName:@"Arial" fontSize:30];
        retryTime.position = ccp(160,150);
        retryTime.color = ccGREEN;
        [self addChild:retryTime];
        
        
        
        
        
        
        [self scheduleUpdate];
    }
    
	return self;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    lost *layer = [lost node];
    
    [scene addChild:layer];
    
    return scene;
}

-(void) update:(ccTime)delta
{
    KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:back touchPhase:KKTouchPhaseBegan])

    {
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];
        NSLog(@"Player has gone back to gamemode");
    }
    
    if ([input isAnyTouchOnNode:retryTime touchPhase:KKTouchPhaseBegan]) {
        NSLog(@"PLayer is retrying timeAttack");
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[timeAttack alloc] init]];
    }
    
}
@end

