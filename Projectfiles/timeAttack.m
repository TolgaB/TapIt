//
//  timeAttack.m
//  TapIt-02
//
//  Created by Tolga Beser on 5/4/14.
//
//

#import "timeAttack.h"
#import "Title.h"
#import "HelloWorldLayer.h"
#import "GameMode.h"
@implementation timeAttack
int tscore = 0;
int tlatestscore = 0;
CCLabelTTF* title;
CCLabelTTF *scoreboard;

-(id) init
{
	if ((self = [super init]))
	{
        
        CCLabelTTF* title = [CCLabelTTF labelWithString:@"TapIt" fontName:@"Chalkduster" fontSize:48];
        title.position = ccp(160,420);
        title.color = ccCYAN;
        [self addChild:title];
        
        
        
        
        
        [self scheduleUpdate];
        
    }
    
	return self;
}


+(id) scene
{
    CCScene *scene = [CCScene node];
    
    timeAttack *layer = [timeAttack node];
    
    [scene addChild: layer];
    
    return scene;
}

-(void) score
{
    
    KKInput* input = [KKInput sharedInput];
    
    if (input.anyTouchBeganThisFrame)
    {
        [self removeChild:scoreboard cleanup:YES];
        NSLog(@"Touch Detected");
        tscore++;
        NSString *scorestring = [[NSString alloc] initWithFormat: @"%i", tscore];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        
    }
}

-(void) update:(ccTime)delta
{
    
   
}

@end
