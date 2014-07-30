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
#define METERS_PER_MILE 1609.344

@interface EventMapViewController () <MKMapViewDelegate, MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSString *subTitle;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) NSArray *Events;
- (void)updateMapViewAnnotation;

@end

@implementation EventMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.740848;
    zoomLocation.longitude= -73.991145;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.mapView.delegate = self;

    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 40.740384;
    coordinate1.longitude = -73.991146;
    EventPin *annotation = [[EventPin alloc] initWithCoordinate:coordinate1 title:@"Starbucks NY" subTitle:@"sub1"];
    [self.mapView addAnnotation:annotation];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 40.741623;
    coordinate2.longitude = -73.992021;
    EventPin *annotation2 = [[EventPin alloc] initWithCoordinate:coordinate2 title:@"Pascal Boyer Gallery" subTitle:@"subhere"];
    [self.mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D coordinate3;
    coordinate3.latitude = 40.739490;
    coordinate3.longitude = -73.991154;
    EventPin *annotation3 = [[EventPin alloc] initWithCoordinate:coordinate3 title:@"Virgin Records" subTitle:@"sub3"];
    [self.mapView addAnnotation:annotation3];

    
    
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
    //[self.mapView removeObserver:self.mapView.annotations];
    //[self.mapView addAnnotation]
}


@end