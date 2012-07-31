//
//  WebView.m
//  Aug2
//
//  Created by Dominick Ciano on 7/31/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "WebView.h"

@implementation WebView

- (id) initWithFrame: (CGRect) frame information: (NSString *) information
{
	self = [super initWithFrame: frame];
	if (self) {
		
		
		// Initialization code
		
		NSURL *url = [NSURL URLWithString: information];
		NSData *data = [NSData dataWithContentsOfURL: url];
		if (data == nil) {
			NSLog(@"could not load URL %@", url);
			return self;
		}
		
		self.scalesPageToFit = YES;	//Can user zoom in and out?
		self.contentMode = UIViewContentModeRedraw;
		
		[self loadData: data
			  MIMEType: @"text/html"
	  textEncodingName: @"NSUTF8StringEncoding"
			   baseURL: url
		 ];
		
		self.alpha = 1;
	}
	
	return self;
}
@end