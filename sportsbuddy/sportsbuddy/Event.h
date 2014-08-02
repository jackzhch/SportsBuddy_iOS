//
//  Event.h
//  sportsbuddy
//
//  Created by DoodleJack on 7/30/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * eventType;
@property (nonatomic, retain) NSDate * eventTime;
@property (nonatomic, retain) NSString * eventLoc;
@property (nonatomic, retain) NSNumber * eventMaxNum;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;

@end