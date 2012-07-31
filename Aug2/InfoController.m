//
//  InfoController.m
//  Aug2
//
//  Created by Dominick Ciano on 7/31/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "InfoController.h"
#import "WebView.h"
@interface InfoController ()

@end

@implementation InfoController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}


- (id) initWithTitle: (NSString *) title information: (NSString *) info ranking: (NSString *) wonderRank{
	self = [super initWithNibName: nil bundle: nil];
	if (self) {
		// Custom initialization
		self.title = title;
		rank = wonderRank;
		
		
		self.navigationItem.rightBarButtonItem =
		[[UIBarButtonItem alloc] initWithTitle: @"Done"
										 style: UIBarButtonItemStylePlain
										target: self
										action: @selector(done)
		 ];
		information = info;
	}
	return self;
}


- (void) done {
	[self dismissModalViewControllerAnimated: YES];
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[WebView alloc] initWithFrame: frame information: information];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
	//											 initWithTitle: @"Back"
	//											 style: UIBarButtonItemStylePlain
	//											 target: self.view
	//											 action: @selector(goBack)
	//											 ];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

@end
