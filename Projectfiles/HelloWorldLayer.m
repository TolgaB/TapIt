/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim.
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"
#import <Social/Social.h>
#import "GameMode.h"

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer
//These are the global variable
int score= 0;
int latestScore= 0;
CCSprite *twitter;
CCLabelTTF* title;
CCLabelTTF *scoreboard;
CCLabelTTF *retry;
CCLabelTTF *backButton;
BOOL retryPressed = false;
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
        if ([input isAnyTouchOnNode:retry touchPhase:KKTouchPhaseEnded])
        {
            if (retryPressed == false) {
                retryPressed = true;
                NSLog(@"Test1");
                [[CCDirector sharedDirector] replaceScene: (CCScene*)[[HelloWorldLayer alloc] init]];
                score = 0;
            }
            
        }
    }
    
    
    if(score >= 0) {
        [self score];
    }
    KKInput* input = [KKInput sharedInput];
    if ([input isAnyTouchOnNode:twitter touchPhase:KKTouchPhaseBegan])
    {
        NSLog(@"User pressed the tweet button");
        [self tweetT];
    }
    
    if ([input isAnyTouchOnNode:backButton touchPhase:KKTouchPhaseBegan]) {
        NSLog(@"User clicked the back button");
        [[CCDirector sharedDirector] replaceScene: (CCScene*)[[GameMode alloc] init]];

    }
    
    
}

-(void) tweetT {
    SLComposeViewController* mySLComposerSheet= nil;
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter]; //Tell him with what social plattform to use it, e.g. facebook or twitter
        NSString* posteR= [[NSString alloc] initWithFormat: @"I just got %i on TapIt", latestScore];
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"%@", posteR, mySLComposerSheet.serviceType]]; //the message you want to post
        //[mySLComposerSheet addURL: [NSURL URLWithString:shortenedURL]]; //an image you could post
        //for more instance methodes, go here:https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Reference/SLComposeViewController_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40012205
        [[CCDirector sharedDirector] presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
    [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        } //check if everythink worked properly. Give out a message on the state.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tweet" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        //alert.tag= TAG_ALERT_OTHER;
        [alert show];
    }];
    
}


-(void) timeisup
{
    retryPressed = false;
    NSLog(@"Timeisup");
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
        
        backButton = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:32];
        backButton.position = ccp(250, 100);
        backButton.color = ccRED;
        [self addChild:backButton];
        
        
        gameisover = true;
        
        
        twitter = [CCSprite spriteWithFile:@"tweetIcon.png"];
        twitter.position = ccp(50, 100);
        
        [self addChild:twitter];
        
        
    }
}

-(void) score
{
    
    KKInput* input = [KKInput sharedInput];
    
    if (input.anyTouchBeganThisFrame)
    {
        
        [self removeChild:scoreboard cleanup:YES];
        
        score++;
        NSString *scorestring = [[NSString alloc] initWithFormat: @"%i", score];
        scoreboard = [CCLabelTTF labelWithString:scorestring fontName:@"Arial" fontSize:32];
        scoreboard.position = ccp(160, 300);
        [self addChild:scoreboard];
        
    }
}



@end