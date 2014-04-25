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

int score;

CCLabelTTF* title;
CCSprite *scoreboard;


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
        
    
        
	}

	return self;
}
-(void) update:(ccTime)dt
{
  
    [self addChild:title];
    [self addChild:scoreboard];
    [self score];

}
-(void) score
{
    
    
    if ([KKInput sharedInput].touchesAvailable)
    {
        NSLog(@"Touch Detected");
        score++;
        NSString *scorestring = [[NSString alloc] initWithFormat: @"%i strong", score];
        CCLabelTTF* scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        
    }
}

@end
