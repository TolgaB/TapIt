//
//  timeAttack.m
//  TapIt-02
//
//  Created by Tolga Beser on 5/4/14.
//
//

#import "timeAttack.h"
#import "Title.h"

#import "GameMode.h"
@implementation timeAttack
int tscore = 0;
int tlatestscore = 0;
CCLabelTTF* title;
CCLabelTTF *scoreboard;
CCLabelTTF *firstdone;
CCLabelTTF *dead;
NSTimer* myTimer = nil;
-(id) init
{
	if ((self = [super init]))
	{
        
        CCLabelTTF* title = [CCLabelTTF labelWithString:@"TapIt" fontName:@"Chalkduster" fontSize:48];
        title.position = ccp(160,420);
        title.color = ccCYAN;
        [self addChild:title];
        
        myTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(firstleveldone) userInfo:nil repeats:NO];
        
        
        
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
        [self removeChild:firstdone];
        [self removeChild:scoreboard cleanup:YES];
        NSLog(@"Touch Detected");
        tscore++;
        NSString *scorestring = [[NSString alloc] initWithFormat: @"%i", tscore];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        
    }
}

-(void) firstleveldone
{
    tlatestscore = tscore;
    tscore = 0;
    [self removeChild:scoreboard cleanup:YES];
    if (tlatestscore > 30) {
        NSLog(@"Player has passed the level");
        
        firstdone = [CCLabelTTF labelWithString:@"Level 1 Completed." fontName:@"Arial" fontSize:32];
        firstdone.position = ccp(160, 200);
        [self addChild:firstdone];
        
        [myTimer invalidate];
        myTimer = nil;
        
    }
    else {
        NSLog(@"Player could not pass the level");
        dead = [CCLabelTTF labelWithString:@"Too bad you couldn't pass the level" fontName:@"Arial" fontSize:32];
        dead.position = ccp(160,240);
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];
        [self addChild:dead];
    }
    
    
    
}

-(void) update:(ccTime)delta
{
    
    if(tscore >= 0) {
        [self score];
    }
    
}

@end
