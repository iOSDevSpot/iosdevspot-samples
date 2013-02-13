//
//  Tweet.h
//  AppNetwork
//
//  Created by Fernando Ribeiro on 2/5/13.
//  Copyright (c) 2013 Fernando Bass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject
@property (strong) NSString *from_user;
@property (strong) NSString *text;
@property (strong) NSURL *profile_image_url;
@end
