//
//  LocationSerachViewController.m
//  sportsbuddy
//
//  Created by DoodleJack on 8/1/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "LocationSerachViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "EventPin.h"
#import "EventItem.h"
#import "MMLocationManager.h"

#define METERS_PER_MILE 1609.344

@interface LocationSerachViewController () <MKMapViewDelegate, MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) NSMutableArray *eventItems;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *searchText;


- (IBAction)searchLocation:(UIButton *)sender;

- (void)updateMapViewAnnotation;

@end

@implementation LocationSerachViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _eventItem = [[EventItem alloc]init];
    self.mapView.delegate = self;
    //[self loadInitialData];
    
    // Set initial zoom location
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.44;
    zoomLocation.longitude= -79.9;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
    
    // long press gesture listener to call for action of adding annotation
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleGesture:)];
    lpgr.minimumPressDuration = 2.0;  //user must press for 2 seconds
    [_mapView addGestureRecognizer:lpgr];
    
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:_mapView];
    CLLocationCoordinate2D touchMapCoordinate =
    [_mapView convertPoint:touchPoint toCoordinateFromView:_mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = touchMapCoordinate;
    
    // Reverse geocoding
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:annotation.coordinate.latitude longitude:annotation.coordinate.longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error){
            NSLog(@"Geocode failed with error: %@", error);
            return;
        }
        //NSLog(@"Received placemarks: %@", placemarks);
        annotation.title = [NSString stringWithFormat:@"%@", placemarks];
    }];
    //annotation.title = @"422";
    NSLog(@"title is ,   %@", annotation.title);
    [_mapView addAnnotation:annotation];
    _eventItem.coordinate = touchMapCoordinate;

}

- (void)loadInitialData
{
//    CLLocationCoordinate2D coordinate;
//    
//    EventItem *eventItem1 = [[EventItem alloc] init];
//    eventItem1.eventType = @"this is a test1";
//    coordinate.latitude = 40.740384;
//    coordinate.longitude = -73.991146;
//    eventItem1.coordinate = coordinate;
//    [self.eventItems addObject:eventItem1];
//    EventPin *annotation = [[EventPin alloc] initWithCoordinate:eventItem1.coordinate title:eventItem1.eventType subTitle:@"sub1"];
//    [_mapView addAnnotation:annotation];
}


- (IBAction)searchLocation:(UIButton *)sender {
    CLLocationCoordinate2D coordinate;
    
//    EventItem *eventItem2 = [[EventItem alloc] init];
//    eventItem2.eventType = @"this is a test2";
//    coordinate.latitude = 40;
//    coordinate.longitude = -73.1;
//    eventItem2.coordinate = coordinate;
//    [self.eventItems addObject:eventItem2];
//    EventPin *annotation2 = [[EventPin alloc] initWithCoordinate:eventItem2.coordinate title:eventItem2.eventType subTitle:@"sub1"];
//    [self.mapView addAnnotation:annotation2];

    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:[NSString stringWithFormat:@"%@", self.searchText.text] completionHandler:^(NSArray* placemarks, NSError* error){
        for (CLPlacemark* aPlacemark in placemarks)
        {
            _eventItem.coordinate = aPlacemark.location.coordinate;
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
            annotation.coordinate = aPlacemark.location.coordinate;
            annotation.title = self.searchText.text;
            //annotation.title = @"111";
            [_mapView addAnnotation:annotation];
            
        }
    }];

    
}

- (void)updateMapViewAnnotation
{
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    //if (self.textField.text.length) {
    CLLocationCoordinate2D coordinate;
    _eventItem.eventType = @"soccer";
//    self.eventItem.latitude = [self.eventLat.text doubleValue];
//    self.eventItem.longitude = [self.eventLng.text doubleValue];
    coordinate.latitude = self.eventItem.latitude;
    coordinate.longitude = self.eventItem.longitude;
    
    
}


@end