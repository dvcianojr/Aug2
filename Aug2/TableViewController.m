//
//  TableViewController.m
//  Aug2
//
//  Created by Dominick Ciano on 7/31/12.
//  Copyright (c) 2012 Abel / Noser Corp. All rights reserved.
//

#import "TableViewController.h"
#import "InfoController.h"

@implementation TableViewController

- (id) initWithStyle: (UITableViewStyle) style
{
	self = [super initWithStyle: style];
	if (self) {
		// Custom initialization
		
		NSStringEncoding encoding;
		NSString* content;
		NSString* path = [[NSBundle mainBundle] pathForResource:@"7Wonders" ofType:@"txt"];
		if(path)
		{                                               
			content = [NSString stringWithContentsOfFile:path  usedEncoding:&encoding  error:nil];
		}
		NSLog(@"path is %@",path);
		if (content)
		{
			NSLog(@" content of file is %@",content);
		}
		
		// load file as separate rows into array
		NSArray* rowsOfData = 
		[content componentsSeparatedByCharactersInSet:
		 [NSCharacterSet newlineCharacterSet]];
		
		wonders = [NSMutableArray arrayWithCapacity:rowsOfData.count];
		ranks = [NSMutableArray arrayWithCapacity:rowsOfData.count];
		urls = [NSMutableArray arrayWithCapacity:rowsOfData.count];
		// parse a row
		for (int i=0; i<rowsOfData.count; ++ i)
		{
			NSArray *cols = [[rowsOfData objectAtIndex:i] componentsSeparatedByString:@"|"];
			NSString *wonder = [cols objectAtIndex:0];	
			wonder = [wonder substringWithRange: NSMakeRange (1, wonder.length - 2)];//remove double quotes	
			NSString *rank = [cols objectAtIndex:1];	
			rank = [rank substringWithRange: NSMakeRange (1, rank.length - 2)];//remove double quotes	
			NSString *wonderURL = [cols objectAtIndex:2];	
			wonderURL = [wonderURL substringWithRange: NSMakeRange (1, wonderURL.length - 2)];//remove double quotes				
			NSLog(@"wonder=%@, rank=%@, wonderURL=%@",wonder,rank,wonderURL);
			[wonders addObject:wonder];
			[ranks addObject:rank];
			[urls addObject:wonderURL];
			
		}
		
		
		
		//default values from class UIScrollView.
		
		self.tableView.bounces = YES;
		self.tableView.scrollsToTop = YES;
		self.tableView.decelerationRate = UIScrollViewDecelerationRateNormal;
	}
	return self;
}

- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) viewDidLoad
{
	[super viewDidLoad];
	
	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void) viewWillAppear: (BOOL) animated
{
	[super viewWillAppear: animated];
}

- (void) viewDidAppear: (BOOL) animated
{
	[super viewDidAppear:animated];
}

- (void) viewWillDisappear: (BOOL) animated
{
	[super viewWillDisappear: animated];
}

- (void) viewDidDisappear: (BOOL) animated
{
	[super viewDidDisappear: animated];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView
{
	// Return the number of sections.
	return 1;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
	NSAssert1(section == 0, @"section number %d must be 0.", section);
	// Return the number of rows in the section.
	return wonders.count;
}

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath
{
	static NSString *identifier = @"wonderNames";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: identifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier];
	}
	
	// Configure the cell...
	//The .textLabel and .detailTextLabel properties are UILabels.
	//The .imageView property is a UIImage.
	cell.textLabel.text = [wonders objectAtIndex: indexPath.row];
	NSString *fileName = [cell.textLabel.text stringByAppendingString: @".jpg"];
	cell.imageView.image = [UIImage imageNamed: fileName];	//nil if .jpg file doesn't exist
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // add little arrow to right hand side of cell
	return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL) tableView: (UITableView *) tableView canEditRowAtIndexPath: (NSIndexPath *) indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void) tableView: (UITableView *) tableView commitEditingStyle: (UITableViewCellEditingStyle) editingStyle forRowAtIndexPath: (NSIndexPath *) indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject:indexPath] withRowAnimationUITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void) tableView: (UITableView *) tableView moveRowAtIndexPath: (NSIndexPath *) fromIndexPath toIndexPath:(NSIndexPath *) toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL) tableView: (UITableView *) tableView canMoveRowAtIndexPath: (NSIndexPath *) indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
	// Navigation logic may go here. Create and push another view controller.
	/*
	 DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName: @"Nib name" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController: detailViewController animated: YES];
	 */
	
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
	
	NSString *wonderNameHdg = [wonders objectAtIndex:indexPath.row];
	NSString *wonderRank = [ranks objectAtIndex:indexPath.row];
	NSString *information = [urls objectAtIndex:indexPath.row];
	
	
	InfoController *infoController = [[InfoController alloc]
									  initWithTitle: wonderNameHdg
									  information: information 
									  ranking: wonderRank
									  ];
	
	//Create a navigation controller to make the infoController's navigation item
	//(containing the Done button) visible.
	UINavigationController *navigationController =
	[[UINavigationController alloc] initWithRootViewController: infoController];
	
	[self presentModalViewController: navigationController animated: YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
	return @"7 Wonders of the World";
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
    return  30.0;
}
@end
