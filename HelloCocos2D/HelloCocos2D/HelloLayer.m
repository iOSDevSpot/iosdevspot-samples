//
//  HelloLayer.m
//  HelloCocos2D
//
//  Created by xissburg on 11/20/12.
//
//

#import "HelloLayer.h"

@implementation HelloLayer

+ (CCScene *)scene
{
    id layer = [HelloLayer node];
    CCScene *scene = [CCScene node];
    [scene addChild:layer];
    return scene;
}

- (id)init
{
    self = [super init];
    if (self) {
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello cocos2d!" fontName:@"Marker Felt" fontSize:24];
        CGSize size = [CCDirector sharedDirector].winSize;
        label.position = ccp(size.width/2 + 150, size.height/2 - 130);
        [self addChild:label];
        
        CCSprite *blanka = [CCSprite spriteWithFile:@"BlankaStanding0.png"];
        blanka.position = ccp(size.width/2, size.height/2);
        [self addChild:blanka];
        
        id delay = [CCDelayTime actionWithDuration:3];
        id moveBy = [CCMoveBy actionWithDuration:3 position:ccp(100, 50)];
        id sequence = [CCSequence actions:delay, moveBy, nil];
        [blanka runAction:sequence];
    }
    return self;
}

@end
