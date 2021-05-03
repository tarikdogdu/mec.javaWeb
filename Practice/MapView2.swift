//
////
////  MapView.swift
////  Practice
////
////  Created by Burhan Tarık Doğdu on 6.03.2021.
////
//
//import SwiftUI
//import MapKit
//import Combine
//import UIKit
//
//struct Annotations: Identifiable , Decodable {
//    var id = UUID()
//    let latitude: Double
//    let longitude: Double
//    let title: String
//    let subtitle: String
//    let Number: String
//    let adress: String
//    let riskPoint: Int
//
//
//    private enum CodingKeys: CodingKey{
//        case latitude             //json dosyasında id olmadığından burdan yok saymak için codingkeys kullandık
//        case longitude
//        case title
//        case subtitle
//        case Number
//        case adress
//        case riskPoint
//
//    }
//}
//
//struct MapView: View {
//
//    @State var searchedMapObject: String = ""
//    @State private var pinpointExtended: Bool = false
//    @State private var annotationsArr = [Annotations]()
//
//    @State private var safePlaces = [Annotations]()
//
//    @ObservedObject private var locationManager = LocationManager()
//    @State private var locationRegion = MKCoordinateRegion()
//    @State private var cancellable: AnyCancellable?
//
//    func currentLocation(){
//        cancellable = locationManager.$location.sink{ location in
//            locationRegion = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(),
//                                                latitudinalMeters: 500, longitudinalMeters: 500)
//        }
//
//    }
//
//    private func loadAnnotations(){  // Json Annotation Location from annocationLocations
//
//        guard let path = Bundle.main.path(forResource: "AnnotationLocations", ofType: "json") else {
//            fatalError("JSON file bulunamadı.")
//        }
//        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
//
//        let receivedAnnotation = try? JSONDecoder().decode([Annotations].self, from: data) // normalde burda AF request açıp serverdan alınabilir.biz dosyadan alıyoruz.
//        if let receivedAnnotation = receivedAnnotation{
//            self.annotationsArr = receivedAnnotation
//        }
//    }
//
//
//    var body: some View {
//
//
//
//        VStack{
//
//            if locationManager.location != nil{
//
//                Map(coordinateRegion: $locationRegion, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil, annotationItems: annotationsArr)
//                { annotation in
//
//                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude)){
//
//                        Button {
//                            //
//                        } label: {
//                            Image(systemName: "mappin.circle")
//                                .resizable()
//                                .accentColor(.blue)
//                                .frame(width: 30, height: 30)
//                        }
//                    }
//
//
//                }
//                .ignoresSafeArea()
//                .overlay(
//
//                    VStack{
//                        TextField("Arama", text: $searchedMapObject)
//                            .padding(EdgeInsets(top: 50, leading: 20, bottom: 50, trailing: 20))
//                            .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.height*0.06)
//                            .background(Color.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
//                            .shadow(radius: 4)
//                            .offset(x: 0, y: 20)
//
//                        Spacer()
//
//                    }
//                )
//            }else{
//                Text("Looking for location..")
//            }
//        }.onAppear{
//            currentLocation()
//            loadAnnotations()
//        }
//    }
//}
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
