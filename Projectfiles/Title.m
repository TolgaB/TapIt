//
//  Title.m
//  
//
//  Created by Tolga Beser on 5/2/14.
//
//

#import "Title.h"
#import "HelloWorldLayer.h"
#import "GameMode.h"
CCLabelTTF *title;
CCLabelTTF *play;

    

@implementation Title
-(id) init
{
	if ((self = [super init]))
	{
        
        title = [CCLabelTTF labelWithString:@"TapIt" fontName:@"Chalkduster" fontSize:64];
        title.color = ccRED;
        title.position = ccp(160, 360);
        [self addChild:title];
        
        play = [CCLabelTTF labelWithString:@"Play" fontName:@"Courier-Bold" fontSize:42];
        play.color = ccORANGE;
        play.position = ccp(160, 200);
        [self addChild:play];
        
        
        
        
        
        
        [self scheduleUpdate];
        
        
        
    }
    
	return self;
}




-(void) update:(ccTime)delta
{
    KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:play touchPhase:KKTouchPhaseBegan])

    {
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];
        NSLog(@"Play");
    }
    }

@end
