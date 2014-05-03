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
BOOL gameisover;
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
        CCLabelTTF* title = [CCLabelTTF labelWithString:@"TapIt" fontName:@"Arial" fontSize:32];
        title.position = ccp(160, 420);
        title.color = ccCYAN;
        [self addChild:title];
        score = 0;
        [self scheduleUpdate];
        NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeisup) userInfo:nil repeats:NO];
        gameisover = false;
        
	}
    
	return self;
}
-(void) update:(ccTime)dt
{
    if(gameisover) {
     KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:retry touchPhase:KKTouchPhaseBegan])
    {
        
        NSLog(@"Retry Pressed");
        
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
    score= -1;
    if (score == -1) {
        
        NSString *scorestring = [[NSString alloc] initWithFormat: @" Your score is %i", latestScore];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.color = ccORANGE;
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        CCLabelTTF* retry = [CCLabelTTF labelWithString:@"Retry" fontName:@"Arial" fontSize:64];
        retry.position = ccp(160, 200);
        [self addChild:retry];
        gameisover = true;
        
    }
}

-(void) score
{
    
    
    if ([KKInput sharedInput].touchesAvailable)
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