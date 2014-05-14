//
//  lostTime.m
//  TapIt-02
//
//  Created by Tolga Beser on 5/11/14.
//
//

#import "lostTime.h"
#import "GameMode.h"
#import "timeAttack.h"





@implementation lostTime
CCLabelTTF *youlose;
CCLabelTTF *back;
-(id) init
{
	if ((self = [super init]))
	{
        
        youlose =[CCLabelTTF labelWithString:@"Better Luck Next Time" fontName:@"Arial" fontSize:28];
        youlose.position = ccp(160, 320);
        youlose.color = ccBLUE;
        [self addChild:back];
        
        back = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:24];
        back.position = ccp(160, 50);
        back.color = ccRED;
        [self addChild:back];
        
    }
    
	return self;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    lostTime *layer = [lostTime node];
    
    [scene addChild:layer];
    
    return scene;
}

-(void) update:(ccTime)delta
{
   KKInput* input = [KKInput sharedInput];
     if ([input isAnyTouchOnNode:back touchPhase:KKTouchPhaseBegan])
     {
         [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];
     }
}

@end