//
//  MapViewController.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 5/6/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit
import MapKit


final class MapViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var currentLocationButton: UIButton!

    var viewModel: MapViewControllerModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        addAnnotation()
        addOverlayData()
        setupUI()
    }

    // MARK: - Private functions
    private func setupUI() {
        title = "Map"
        mapView.showsUserLocation = true
        mapView.delegate = self
        // Get camera of map view zoom to current location
        moveToCurrentLocation(UIButton())
    }

    private func center(location: CLLocation) {
        mapView.setCenter(location.coordinate, animated: true)
        //zoom
        let span = Config.coordinateSpan
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }

    private func addAnnotation() {
        mapView.addAnnotations(Config.pins)
    }

    @IBAction private func moveToCurrentLocation(_ sender: UIButton) {
        guard let viewModel = viewModel else { return }
        viewModel.getCurrentLocation { [weak self] location in
            self?.center(location: location)
        }
    }

    private func addOverlayData() {
        for center in Config.coordinates {
            let radius = Config.radiusOfOverlay
            let overlay = MKCircle(center: center, radius: radius)
            //add circle
            mapView.addOverlay(overlay)
        }
    }

    private func routing(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        // remove all polyline before add new one
        removeOverlay(with: .polyline)
        // add a polyline of route
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: source, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination, addressDictionary: nil))
        request.requestsAlternateRoutes = false
        request.transportType = .automobile
        let directions = MKDirections(request: request)
        directions.calculate { [weak self] response, error in
            guard let unwrappedResponse = response else { return }
            for route in unwrappedResponse.routes {
                self?.mapView.addOverlay(route.polyline)
                self?.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }

    private func addPin(coordinate: CLLocationCoordinate2D, title: String, subTitle: String) {
        let pin = MyPin(title: title, locationName: subTitle, coordinate: coordinate)
        self.mapView.addAnnotation(pin)
    }

    private func routing(with destination: CLLocationCoordinate2D) {
        guard let source = viewModel?.getSourceCoordinate(),
              let destination = viewModel?.getDestinationCoordinate() else { return }
        addPin(coordinate: destination, title: "Asian Tech",
               subTitle: "Da Nang, Viet Nam")
        routing(source: source, destination: destination)
    }

    private func updatingLocation() {
        viewModel?.updatingLocation { [weak self] location in
            self?.center(location: location)

        }
    }

    // MARK: - Remove function
    private func removeOverlay(with type: OverlayType) {
        switch type {
        case .polyline:
            self.mapView.overlays
                .compactMap { $0 as? MKPolyline }
                .forEach { self.mapView.removeOverlay($0) }
        case .circle:
            self.mapView.overlays
                .compactMap { $0 as? MKCircle }
                .forEach { self.mapView.removeOverlay($0) }
        }
    }
}

// MARK: Extension of mapview Delegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MyPin else { return nil }
        let identifier = "mypin"
        var view: MKPinAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            // Info button for righr callout
            let button = UIButton(type: .detailDisclosure)
            button.addTarget(self, action: #selector(selectPinView(_:)), for: .touchDown)
            view.rightCalloutAccessoryView = button
            // Direction button for left callout
            let butonDirection = UIButton(type: .detailDisclosure)
            butonDirection.setImage(UIImage(systemName: "car"), for: .normal)
            butonDirection.addTarget(self, action: #selector(directionButtonTouchUpInside), for: .touchUpInside)
            view.leftCalloutAccessoryView = butonDirection
            view.pinTintColor = .green
            view.animatesDrop = true
        }
        view.canShowCallout = true
        return view
    }

    // MARK: - Actions of Buttons
    @objc func directionButtonTouchUpInside(_ sender: UIButton?) {
        guard let destination = viewModel?.getDestinationCoordinate() else { return }
        routing(with: destination)
    }

    @objc func selectPinView(_ sender: UIButton?) {
        print("select button detail")
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("selected Callout")
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Selected pin")
        guard let pinCoordinate = view.annotation?.coordinate else { return }
        viewModel?.setDestinationCoordinate(with: pinCoordinate)
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 3
            return renderer

        } else if let circle = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: circle)
            circleRenderer.fillColor = Config.circleFillColor
            circleRenderer.strokeColor = Config.circleStrokeColor
            circleRenderer.lineWidth = Config.circleLineWidth
            circleRenderer.lineDashPhase = Config.circleLineDashPhase
            return circleRenderer

        } else {
            return MKOverlayRenderer()
        }
    }
}

// MARK: - Config
extension MapViewController {
    struct Config {
        // Properties for circle renderer
        static let circleStrokeColor: UIColor = .blue
        static let circleLineWidth: CGFloat = 1
        static let circleLineDashPhase: CGFloat = 10
        static let circleFillColor: UIColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5)

        static let radiusOfOverlay: CLLocationDistance = 100.0  // Distance unit: meters
        static let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)

        // Properties for locations
        static let currentLocation: CLLocationCoordinate2D =
            CLLocationCoordinate2D(latitude: 16.04724, longitude: 108.2344111)
        static let coordinates = [
            CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963),
            CLLocationCoordinate2D(latitude: 16.074443, longitude: 108.224443),
            CLLocationCoordinate2D(latitude: 16.073969, longitude: 108.228798),
            CLLocationCoordinate2D(latitude: 16.069783, longitude: 108.225086),
            CLLocationCoordinate2D(latitude: 16.070629, longitude: 108.228563)]
        static let pins: [MyPin] = [
            MyPin(title: "Point 0001",
                  locationName: "Point 0001",
                  coordinate: coordinates[0]),
            MyPin(title: "Point 0002",
                  locationName: "Point 0002",
                  coordinate: coordinates[1]),
            MyPin(title: "Point 0003",
                  locationName: "Point 0003",
                  coordinate: coordinates[2]),
            MyPin(title: "Point 0004",
                  locationName: "Point 0004",
                  coordinate: coordinates[3]),
            MyPin(title: "Point 0005",
                  locationName: "Point 0005",
                  coordinate: coordinates[4])]
    }
}

extension MKMapView {
    func animatedZoom(zoomRegion:MKCoordinateRegion, duration:TimeInterval) {
        MKMapView.animate(withDuration: duration,
                          delay: 0,
                          usingSpringWithDamping: 0.6,
                          initialSpringVelocity: 10,
                          options: UIView.AnimationOptions.curveEaseIn,
                          animations: {
                            self.setRegion(zoomRegion, animated: true)
                          }, completion: nil)
    }
}
