//
//  timeAttackWon.m
//  TapIt-02
//
//  Created by Tolga Beser on 5/11/14.
//
//

#import "Title.h"
#import "GameMode.h"
#import "timeAttack.h"
#import "timeAttackWon.h"

CCLabelTTF *won;
CCLabelTTF *back;




@implementation timeAttackWon
-(id) init
{
	if ((self = [super init]))
	{
        won = [CCLabelTTF labelWithString:@"TimeAttack Completed Congrats" fontName:@"Arial" fontSize:28];
        won.position = ccp(160,320);
        won.color = ccRED;
        [self addChild:won];
        
        back = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:24];
        back.position = ccp(160, 50);
        back.color = ccORANGE;
        
        [self addChild:back];
        
        [self scheduleUpdate];
    }
    
	return self;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    timeAttackWon *layer = [timeAttackWon node];
    
    [scene addChild: layer];
    
    return scene;
}



-(void) update:(ccTime)delta
{
      KKInput* input = [KKInput sharedInput];
     if ([input isAnyTouchOnNode:back touchPhase:KKTouchPhaseBegan])
     {
         NSLog(@"User pressed back button");
         [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];
     }
    
}

@end