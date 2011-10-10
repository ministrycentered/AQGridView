//
//  AQGridViewAnimatorItem.m
//  Kobov3
//
//  Created by Jim Dovey on 10-06-29.
//  Copyright 2010 Kobo Inc. All rights reserved.
//

#import "AQGridViewAnimatorItem.h"

@implementation AQGridViewAnimatorItem

@synthesize animatingView, indexPath;

+ (AQGridViewAnimatorItem *) itemWithView: (UIView *) aView indexPath: (NSIndexPath *) anIndexPath
{
	AQGridViewAnimatorItem * result = [[self alloc] init];
	result.animatingView = aView;
	result.indexPath = anIndexPath;
	return ( [result autorelease] );
}

- (void) dealloc
{
	self.animatingView = nil;
	[super dealloc];
}

- (NSIndexPath *) hash
{
	return ( self.indexPath );
}

- (BOOL) isEqual: (AQGridViewAnimatorItem *) o
{
	if ( [o isKindOfClass: [self class]] == NO )
		return ( NO );
	
    //PF
    // need to redo this comparison
    
	if ( [o.indexPath compare: self.indexPath] == NSOrderedSame ) return YES;
    else return NO;
}

- (NSComparisonResult) compare: (id) obj
{
	if ( [obj isKindOfClass: [self class]] == NO )
	{
		if ( (void *)self < (void *)obj )
			return ( NSOrderedAscending );
		if ( (void *)self > (void *)obj )
			return ( NSOrderedDescending );
		return ( NSOrderedSame );			// how ??!?!?
	}
	
	AQGridViewAnimatorItem * item = (AQGridViewAnimatorItem *) obj;
	
	return ( [self.indexPath compare:item.indexPath] );
}

@end
