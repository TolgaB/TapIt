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
#import <Social/Social.h>

CCLabelTTF *won;
CCLabelTTF *back;
CCSprite *twitter;




@implementation timeAttackWon
-(id) init
{
	if ((self = [super init]))
	{
        won = [CCLabelTTF labelWithString:@"TimeAttack Completed" fontName:@"Thonburi-Bold" fontSize:28];
        won.position = ccp(160,320);
        won.color = ccRED;
        [self addChild:won];
        
        back = [CCLabelTTF labelWithString:@"Back" fontName:@"Arial" fontSize:24];
        back.position = ccp(160, 150);
        back.color = ccGREEN;
        
        twitter = [CCSprite spriteWithFile:@"tweetIcon.png"];
        twitter.position = ccp(50, 100);
        
        [self addChild:twitter];
        
        
        [self addChild:back];
        
        [self scheduleUpdate];
    }
    
	return self;
}

-(void) tweetT {
    SLComposeViewController* mySLComposerSheet= nil;
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter]; //Tell him with what social plattform to use it, e.g. facebook or twitter
        NSString* posteR= [[NSString alloc] initWithFormat: @"I just beat TimeAttack on Tapit"];
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
    
    if ([input isAnyTouchOnNode:twitter touchPhase:KKTouchPhaseBegan])
    {
        NSLog(@"User pressed the tweet button");
        [self tweetT];
    }
    
}

@end