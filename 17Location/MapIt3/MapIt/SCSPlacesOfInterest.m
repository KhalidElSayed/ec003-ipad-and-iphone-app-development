#import "SCSPlacesOfInterest.h"
#import "SCSPlace.h"

@implementation SCSPlacesOfInterest
@synthesize annotations = _annotations;
- (CLLocationCoordinate2D)centerOfMap {
    return CLLocationCoordinate2DMake(37.784835, -122.404218);
}
- (SCSPlace *)mosconeWest {
    return [[SCSPlace alloc]
            initWithLocation:CLLocationCoordinate2DMake(37.783147,-122.403209)
                       title:@"Moscone West"
                    subtitle:@"WWDC Sessions"
                    pinColor:MKPinAnnotationColorGreen];
}
- (SCSPlace *)unionSquareAppleStore {
    return [[SCSPlace alloc]
            initWithLocation:CLLocationCoordinate2DMake(37.78586, -122.406471)
                       title:@"Apple Store"
                    subtitle:@"Talks and toys"
                    pinColor:MKPinAnnotationColorRed];
}
- (NSMutableArray *)annotations {
    if (! _annotations) {
        _annotations = [@[[self mosconeWest], [self unionSquareAppleStore]] mutableCopy];
    }
    return _annotations;
}
- (MKPolyline *) happyTrail {
    CLLocationCoordinate2D happyTrail[5];
    happyTrail[0] = [self mosconeWest].coordinate;
    happyTrail[1] = CLLocationCoordinate2DMake(37.783045,-122.403005);
    happyTrail[2] = CLLocationCoordinate2DMake(37.783299,-122.402716);
    happyTrail[3] = CLLocationCoordinate2DMake(37.785733,-122.405838);
    happyTrail[4] = [self unionSquareAppleStore].coordinate;
    return [MKPolyline polylineWithCoordinates:happyTrail
                                         count:5];
}
@end
