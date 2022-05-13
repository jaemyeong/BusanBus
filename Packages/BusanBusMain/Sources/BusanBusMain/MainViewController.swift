import UIKit

import CoreLocation

import os

import NMapsMap

public final class MainViewController: UIViewController {
    public override func loadView() {
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! MainView
        view.mapView.addCameraDelegate(delegate: self)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        CLLocationManager().requestWhenInUseAuthorization()
    }
}

extension MainViewController: NMFMapViewCameraDelegate {
    public func mapView(_ mapView: NMFMapView, cameraIsChangingByReason reason: Int) {
        os_log(.debug, #function)
    }
    
    public func mapView(_ mapView: NMFMapView, cameraWillChangeByReason reason: Int, animated: Bool) {
        switch reason {
        case NMFMapChangedByControl:
            os_log(.debug, "%@ - Control", #function)
        case NMFMapChangedByGesture:
            os_log(.debug, "%@ - Gesture", #function)
        case NMFMapChangedByLocation:
            os_log(.debug, "%@ - Location", #function)
        case NMFMapChangedByDeveloper:
            os_log(.debug, "%@ - Developer", #function)
        default:
            os_log(.debug, #function)
        }
    }
    
    public func mapView(_ mapView: NMFMapView, cameraDidChangeByReason reason: Int, animated: Bool) {
        os_log(.debug, #function)
    }
    
    public func mapViewCameraIdle(_ mapView: NMFMapView) {
        os_log(.debug, #function)
    }
}
