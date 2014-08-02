//
//  EventMapViewController.m
//  sportsbuddy
//
//  Created by DoodleJack on 7/30/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "EventMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "EventPin.h"
#import "EventItem.h"
#import "AddEventViewController.h"
#define METERS_PER_MILE 1609.344

@interface EventMapViewController () <MKMapViewDelegate, MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSString *subTitle;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) NSMutableArray *eventItems;
- (void)updateMapViewAnnotation;

@end

@implementation EventMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.eventItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.740848;
    zoomLocation.longitude= -73.991145;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.mapView.delegate = self;

//    CLLocationCoordinate2D coordinate1;
//    coordinate1.latitude = 40.740384;
//    coordinate1.longitude = -73.991146;
//    EventPin *annotation = [[EventPin alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY" subTitle:@"sub1"];
//    [self.mapView addAnnotation:annotation];
//    
//    CLLocationCoordinate2D coordinate2;
//    coordinate2.latitude = 40.741623;
//    coordinate2.longitude = -73.992021;
//    EventPin *annotation2 = [[EventPin alloc] initWithCoordinate:coordinate2 title:@"Pascal Boyer Gallery" subTitle:@"subhere"];
//    [self.mapView addAnnotation:annotation2];
//    
//    CLLocationCoordinate2D coordinate3;
//    coordinate3.latitude = 40.739490;
//    coordinate3.longitude = -73.991154;
//    EventPin *annotation3 = [[EventPin alloc] initWithCoordinate:coordinate3 title:@"Virgin Records" subTitle:@"sub3"];
//    [self.mapView addAnnotation:annotation3];

    
}

- (void)loadInitialData
{
    CLLocationCoordinate2D coordinate;
    
    EventItem *eventItem1 = [[EventItem alloc] init];
    eventItem1.eventType = @"this is a test1";
    coordinate.latitude = 40.740384;
    coordinate.longitude = -73.991146;
    eventItem1.coordinate = coordinate;
    [self.eventItems addObject:eventItem1];
    EventPin *annotation = [[EventPin alloc] initWithCoordinate:eventItem1.coordinate title:eventItem1.eventType subTitle:@"sub1"];
    [self.mapView addAnnotation:annotation];
    
    EventItem *eventItem2 = [[EventItem alloc] init];
    eventItem2.eventType = @"this is a test2";
    coordinate.latitude = 40;
    coordinate.longitude = -73.1;
    eventItem2.coordinate = coordinate;
    [self.eventItems addObject:eventItem2];
    EventPin *annotation2 = [[EventPin alloc] initWithCoordinate:eventItem2.coordinate title:eventItem2.eventType subTitle:@"sub1"];
    [self.mapView addAnnotation:annotation2];
}

- (void)setMapView:(MKMapView *)mapView
{
    _mapView = mapView;
    self.mapView.delegate = self;
    [self updateMapViewAnnotation];
}

- (void) setEvents:(NSArray *)Events
{
    
}

- (void)updateMapViewAnnotation
{
//    [self.mapView removeObserver:self.mapView.annotations];
//    [self.mapView addAnnotation]
}

- (IBAction)unwindToMap:(UIStoryboardSegue *)segue
{
    AddEventViewController *source = [segue sourceViewController];
    EventItem *newItem = source.eventItem;
    if (newItem != nil) {
        [self.eventItems addObject:newItem];
        EventPin *annotation3 = [[EventPin alloc] initWithCoordinate:newItem.coordinate title:newItem.eventType subTitle:[NSString stringWithFormat:@"%@", newItem.eventNote]];
        [self.mapView addAnnotation:annotation3];
        //[self.mapView ];
    }
}


@end