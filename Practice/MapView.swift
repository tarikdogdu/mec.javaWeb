//
//  MapView.swift
//  Practice
//
//  Created by Burhan Tarık Doğdu on 6.03.2021.
//

import SwiftUI
import MapKit
import Combine
import UIKit

struct Coordinate: Decodable {
        
    let type: String
    let coordinates: [Double]
    
}

struct CompanyType: Decodable {
    
    let IDX: Int
    let TypeName: String
    let CoefficientValue: Int
}

struct Annotations: Identifiable , Decodable {
    var id = UUID()
    let CompanyName: String
    let Logo: String
    let AreaSize: Int
    let MaxCapacity: Int
    let CurrentCapacity: Int
    let Coordinate: Coordinate
    let Distance: Int
    let IsFavoritePoint: Int
    let CompanyType: CompanyType
    
    private enum CodingKeys: CodingKey{
        //json dosyasında id olmadığından burdan yok saymak için codingkeys kullandık 
        case CompanyName
        case Logo
        case AreaSize
        case MaxCapacity
        case CurrentCapacity
        case Coordinate
        case Distance
        case IsFavoritePoint
        case CompanyType
        
    }
}

struct MapView: View {
    
    var count = 0
    @State var searchedMapObject: String = ""
    @State private var pinpointExtended: Bool = false
    @State private var annotationsArr = [Annotations]()
    
    @State private var lowRiskAnnotations = [Annotations]()
    @State private var medRiskAnnotations = [Annotations]()
    @State private var highRiskAnootations = [Annotations]()

    
    @State private var safePlaces = [Annotations]()
        
    @ObservedObject private var locationManager = LocationManager()
    @State private var locationRegion = MKCoordinateRegion()
    @State private var cancellable: AnyCancellable?
    
    func currentLocation(){
        cancellable = locationManager.$location.sink{ location in
            locationRegion = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(),
                                                latitudinalMeters: 40000, longitudinalMeters: 40000)
        }
        
    }
    
    private func loadAnnotations(){  // Json Annotation Location from annocationLocations
        
        guard let path = Bundle.main.path(forResource: "AnnotationResponse", ofType: "json") else {
            fatalError("JSON file bulunamadı.")
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
        
        let receivedAnnotation = try? JSONDecoder().decode([Annotations].self, from: data) // normalde burda AF request açıp serverdan alınabilir.biz dosyadan alıyoruz.
        if let receivedAnnotation = receivedAnnotation{
            self.annotationsArr = receivedAnnotation
        }
    
    }
    
    
    
  
    var body: some View {
        
        
        
        VStack{
                        
            if locationManager.location != nil{
                
                Map(coordinateRegion: $locationRegion, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: annotationsArr)
                { annotation in
                    
//                    MapPin(coordinate: CLLocationCoordinate2D(latitude: annotation.Coordinate.coordinates[0], longitude: annotation.Coordinate.coordinates[1]), tint: .blue)
//
//                    MapPin(coordinate: CLLocationCoordinate2D(latitude: annotation.Coordinate.coordinates[0], longitude: annotation.Coordinate.coordinates[1]), tint: .blue)
//
//                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.Coordinate.coordinates[0], longitude: annotation.Coordinate.coordinates[1])){
//
//
//                    }
                    
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.Coordinate.coordinates[0], longitude: annotation.Coordinate.coordinates[1])){

                            Button {
                                let alert = UIAlertController(title: "Example", message: "This is message panel.", preferredStyle: .alert)
                                
                                let confirm = UIAlertAction(title: "Cancel", style: .default){ (_) in
                                    //                codes here for confirm
                                }
                                let cancel = UIAlertAction(title: "Confirm", style: .cancel){ (_) in
                                    //                codes here for cancel
                                }
                                
                                alert.addAction(confirm)
                                alert.addAction(cancel)
                                
                                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
                                    
                                })
                                
                            }
                                
                                label: {
                                    if annotation.MaxCapacity < 250 {
                                        Image("pin_icon_green")
                                            .resizable()
                                            .frame(width: 30, height: 40)
                                    }else{
                                        Image("pin_icon_yellow")
                                            .resizable()
                                            .frame(width: 30, height: 40)
                                    }
                                    
                            }
                    }
        
                
                }
                .ignoresSafeArea()
                .overlay(
                    
                    VStack{
                   
                        TextField("Arama", text: $searchedMapObject)
                            .padding(EdgeInsets(top: 50, leading: 20, bottom: 50, trailing: 20))
                            .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.06)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
                            .shadow(radius: 4)
                            .offset(x: 0, y: 20)
                        
                        Spacer()
                        
                    }
                )
            }else{
                Text("Looking for location..")
            }
        }.onAppear{
            currentLocation()
            loadAnnotations()
            print(annotationsArr[0].CompanyName)

        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
