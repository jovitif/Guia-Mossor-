//
//  ContentView.swift
//  mapa
//
//  Created by Pablo on 09/11/23.
//
import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -5.18804, longitude: -37.3441), // Mossoró, RN
        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    )
    
    struct pointOnMap: Identifiable {
        let id = UUID()
        var location: MapMarker
    }
    
    let markerLocations = [
            pointOnMap(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: -5.18683, longitude: -37.3464))),
            pointOnMap(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: -5.1721, longitude: -37.3769))),
            pointOnMap(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: -5.200126, longitude: -37.321758)))
        ]
    
    // Locais pré-definidos
    let locations = ["Hospital Wilson Rosado": (coordinate: CLLocationCoordinate2D(latitude: -5.18683, longitude: -37.3464), icon: "cross.case.fill"),
                     "Partage Shopping Mossoró": (coordinate: CLLocationCoordinate2D(latitude: -5.1721, longitude: -37.3769), icon: "building.2.fill"),
                     "Espetinho do Negão": (coordinate: CLLocationCoordinate2D(latitude: -5.200126, longitude: -37.321758), icon: "face.smiling")]
    var dictionary : [String: Local] = [:]
    @State private var selectedLocation = "Hospital Wilson Rosado"
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Local", selection: $selectedLocation) {
                    ForEach(locations.keys.sorted(), id: \.self) { key in
                        Label {
                            Text(key)
                        } icon: {
                            Image(systemName: locations[key]!.icon)
                        }
                        .tag(key)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Map(coordinateRegion: $region, annotationItems: markerLocations) { markerLocations in
                    markerLocations.location
                }
                .onChange(of: selectedLocation) { newValue in
                    let coordinate = locations[newValue]!.coordinate
                    region = MKCoordinateRegion(
                        center: coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
                    )
                }
                if(!viewModel.locais.isEmpty){
                    NavigationLink(destination: Detalhe(local: passDetail(nome: selectedLocation))){
                        Text("Ver detalhes")
                    }
                }
            }
        }
        .onAppear(){
            viewModel.fetchLocais()
        }
    }
    
    func passDetail(nome: String) -> Local{
        let local = viewModel.locais.filter{ local in
            if(local.nome == nome){
                return true
            }
            else{
                return false
            }
        }
        while(local.isEmpty){
        }
        return local[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
