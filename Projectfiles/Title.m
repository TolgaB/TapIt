//
//  Title.m
//  
//
//  Created by Tolga Beser on 5/2/14.
//
//

#import "Title.h"
#import "HelloWorldLayer.h"
CCLabelTTF *title;
CCLabelTTF *play;

    

@implementation Title
-(id) init
{
	if ((self = [super init]))
	{
        
        title = [CCLabelTTF labelWithString:@"Title" fontName:@"Arial" fontSize:32];
        title.color = ccRED;
        title.position = ccp(160, 360);
        [self addChild:title];
        
        play = [CCLabelTTF labelWithString:@"Play" fontName:@"Arial" fontSize:16];
        play.color = ccORANGE;
        play.position = ccp(160, 200);
        [self addChild:play];
        [self scheduleUpdate];
        
        
        
    }
    
	return self;
}

-(void) update:(ccTime)delta
{
    }

@end
