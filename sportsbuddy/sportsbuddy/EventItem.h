//
//  EventItem.h
//  sportsbuddy
//
//  Created by DoodleJack on 7/30/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface EventItem : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *eventType;
@property (strong, nonatomic) NSDate *eventTime;
@property (strong, nonatomic) NSString *eventLoc;
@property int eventMaxNum;
@property double latitude;
@property double longitude;
@property (nonatomic, retain) NSString *eventNote;
@property (nonatomic, retain) NSNumber *currentNum;
@property (nonatomic, retain) NSString *visibility;
@property (nonatomic)  CLLocationCoordinate2D coordinate;

-(void) setCoordinate:(CLLocationCoordinate2D)newCoordinate;

@end
