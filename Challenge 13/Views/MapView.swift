//
//  MapView.swift
//  Challenge 13
//
//  Created by Nikhi on 02/09/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @EnvironmentObject var imageManager: ImageManager
    @Binding var showDetailView: Bool
    @Binding var displayImage: Image?
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            
            let identifier = "Placemark"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let annotation = view.annotation as? MKImagePointAnnotation else {return}
            parent.showDetailView = true
            parent.displayImage = Image(uiImage: annotation.displayImage!)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.addAnnotations(makeAnnotations())
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func getDocumentPath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    func makeAnnotations() -> [MKImagePointAnnotation] {
        var annotations = [MKImagePointAnnotation]()
        for image in imageManager.savedImages {
            let annotation = MKImagePointAnnotation()
            annotation.title = image.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: image.latitude, longitude: image.longitude)
            annotation.displayImage = imageManager.getImage(imageName: image.imageName)
            annotations.append(annotation)
        }
        return annotations
    }
    
    
}
