//
//  InfoController.h
//  Aug2
//
//  Created by Dominick Ciano on 7/31/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoController : UIViewController{
	NSString *information;
	NSString *rank;
}

- (id) initWithTitle: (NSString *) title information: (NSString *) info ranking: (NSString *) wonderRank;

@end
