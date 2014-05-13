//
//  timeAttack.m
//  TapIt-02
//
//  Created by Tolga Beser on 5/4/14.
//
//

#import "timeAttack.h"
#import "Title.h"
#import "timeAttackWon.h"
#import "GameMode.h"
#import "lostTime.h"
@implementation timeAttack
int tscore = 0;
int tlatestscore = 0;
CCLabelTTF* title;
CCLabelTTF *scoreboard;
CCLabelTTF *firstdone;
CCLabelTTF *dead;
CCLabelTTF *secondDone;
BOOL secondtimer = false;
bool firstime = true;
NSTimer* secondTime = nil;
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
        tscore++;
        NSString *scorestring = [[NSString alloc] initWithFormat: @"%i", tscore];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        if (secondtimer) {
            if (firstime){
            NSLog(@"Program Detected The Start Fo Second Timer");
            secondTime = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(secondleveldone) userInfo:nil repeats:NO];
                firstime = false;
            }
        }
        
    }
}

-(void) firstleveldone
{
    tlatestscore = tscore;
    tscore = 0;
    [self removeChild:scoreboard cleanup:YES];
    if (tlatestscore > 10) {
        
        NSLog(@"Player has passed the level");
        
        firstdone = [CCLabelTTF labelWithString:@"Level 1 Completed." fontName:@"Arial" fontSize:32];
        firstdone.position = ccp(160, 200);
        [self addChild:firstdone];
        
        [myTimer invalidate];
        myTimer = nil;
        secondtimer = true;
        tlatestscore = 0;
        
    }
    else {
        NSLog(@"Player could not pass the level");
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[lostTime alloc] init]];
    }
    
    
    
}
//Idea (Have them switch to a scene, after level done win scene, if level lost bring it to a you lose screen.)
-(void) secondleveldone
{
    tlatestscore = tscore;
    tscore = 0;
    [self removeChild:scoreboard cleanup:YES];
    if (tlatestscore > 70) {
        NSLog(@"It worked");
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[timeAttackWon alloc] init]];
        
    }
    else {
        NSLog(@"Player could not pass the level");
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[lostTime alloc] init]];
    }
    
    
    
}

-(void) update:(ccTime)delta
{
    
    
    if(tscore >= 0) {
        [self score];
    }
    
    
    
}

@end
