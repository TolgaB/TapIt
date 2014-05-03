/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim.
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer

int score= 0;
int latestScore= 0;

CCLabelTTF* title;
CCLabelTTF *scoreboard;
CCLabelTTF *retry;
BOOL gameisover = false;
-(id) init
{
	if ((self = [super init]))
	{
		
        
		// "empty" as in "minimal code & resources"
		//CCLabelTTF* label = [CCLabelTTF labelWithString:@"Minimal Kobold2D Project"
        //								   fontName:@"Arial"
        //								   fontSize:20];
		//label.position = [CCDirector sharedDirector].screenCenter;
		//label.color = ccCYAN;
		//[self addChild:label];
        CCLabelTTF* title = [CCLabelTTF labelWithString:@"TapIt" fontName:@"Chalkduster" fontSize:48];
        title.position = ccp(160,420);
        title.color = ccCYAN;
        [self addChild:title];
        score = 0;
        [self scheduleUpdate];
        NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeisup) userInfo:nil repeats:NO];
        
        
	}
    
	return self;
}

+(id) scene
{
    CCScene *scene = [CCScene node];
    
    HelloWorldLayer *layer = [HelloWorldLayer node];
    
    [scene addChild: layer];
    
    return scene;
}



-(void) update:(ccTime)dt
{
    if(gameisover) {
             KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:retry touchPhase:KKTouchPhaseBegan])
    {
        [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
        NSLog(@"Retry Pressed");
        score = 0;
        
    }
    }
    if(score >= 0) {
        [self score];
    }
    
    
}


-(void) timeisup
{
    
    [self removeChild:scoreboard cleanup:YES];
    latestScore= score;
    score = -1;
    if (score == -1) {
        
        NSString *scorestring = [[NSString alloc] initWithFormat: @" Your score is %i", latestScore];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.color = ccORANGE;
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        retry = [CCLabelTTF labelWithString:@"Retry" fontName:@"Arial" fontSize:64];
        retry.position = ccp(160, 200);
        [self addChild:retry];
        gameisover = true;
        
    }
}

-(void) score
{
    
    KKInput* input = [KKInput sharedInput];
    
    if (input.anyTouchBeganThisFrame)
    {
        [self removeChild:scoreboard cleanup:YES];
        NSLog(@"Touch Detected");
        score++;
        NSString *scorestring = [[NSString alloc] initWithFormat: @"%i", score];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        
    }
}



@end