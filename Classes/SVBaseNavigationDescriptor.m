//
//  SVAbstractDescriptor.m
//  
//
//  Created by Robert Evans on 12/27/08.
//  Copyright 2008 South And Valley. All rights reserved.
//

#import "SVBaseNavigationDescriptor.h"
#import "DPResourceFactory.h"

@implementation SVBaseNavigationDescriptor

@synthesize label;
@synthesize nodeIcon;
@synthesize identity;
@synthesize groupItem;
@synthesize type;
@synthesize couchDatabase;
@synthesize resourceFactory;

-(id)initWithLabel:(NSString*)nodeLabel andIdentity:(NSString*)nodeIdentity type:(DPNavigationDescriptorTypes)aType{
    self = [super init];
    if(self){
        self.label = nodeLabel;
        self.identity = nodeIdentity;
        self.groupItem = NO;
        self.type = aType;
    }
    return self;
}
-(BOOL)isGroupItem{
    return self.groupItem;
}
- (NSViewController*) contributionInspectorViewController{
    return nil;
}
- (NSViewController*) contributionMainViewController{    
    if(self.type == DPDescriptorCouchDatabase){
        // XXX WTF do we do here?
        //SBCouchDatabase *couchDatabase = [navDescriptor couchDatabase];
        //NSEnumerator *couchResults = [couchDatabase allDocsInBatchesOf:100];
        // This call will set self as the data source to the NSOutlineView. This may or may not be 
        // a good approach. 
        return [self.resourceFactory namedResource:DPSharedViewContollerNamedViewResults navContribution:self];
    }
        
    return nil;
}

- (NSString*)pluginID{
    return nil;
}

@end
