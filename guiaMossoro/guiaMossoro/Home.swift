//
//  ContentView.swift
//  final
//
//  Created by Pablo on 02/11/23.
//

import SwiftUI

struct Home: View {
    @State private var contentSize: CGSize = .zero
    
    @StateObject var fetchData = FetchData()
    
    @State private var sheetSobre = false
    
    @State private var sheetTemp = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white // custom color.
       }
    
    var body: some View {
        NavigationStack{
            TabView{
                ScrollView{
                    VStack{
                        
                        VStack{
                            Rectangle()
                                .frame(height: 90)
                                .cornerRadius(15)
                                .foregroundColor(.blue)
                                .shadow(radius: 20)
                                .overlay(
                                    HStack{
                                        VStack{
                                            Spacer()
                                            Text("Bem vindo a")
                                                .font(.title)
                                                .bold()
                                            Text("Mossoró")
                                                .font(.largeTitle)
                                                .bold()
                                        }
                                        .foregroundColor(.white)
                                        VStack{
                                            Spacer()
                                            Rectangle()
                                                .frame(width: 130, height: 50)
                                                .foregroundColor(.white)
                                                .cornerRadius(80)
                                                .overlay(
                                                    HStack{
                                                        if let weatherData = fetchData.weatherData {
                                                            Image(systemName: "sun.max.fill")
                                                            Text("\(Int(weatherData.current.temp_c))˚")
                                                                .font(.title2)
                                                        } else{
                                                            Text("...")
                                                        }
                                                    }
                                                        .foregroundColor(.blue)
                                                        .bold()
                                                        .onAppear() {
                                                            fetchData.getData()
                                                        }
                                                )
                                                .onTapGesture {
                                                    sheetTemp = true
                                                }
                                                .sheet(isPresented: $sheetTemp){
                                                    forecastView()
                                                }
                                            
                                        }
                                        .padding()
                                    }
                                )
                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        VStack(alignment: .leading){
                            Text("História")
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .bold()
                            Rectangle()
                                .frame(width: 360, height: 110)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .overlay(
                                    Text("E aí, meu fi! Vou te contar um pouco sobre a cidade de Mossoró, que é conhecida como a Capital do Oeste e Cidade do Sal e do Petróleo. A cidade é tão quente que")
                                        .fontWeight(.medium)
                                        .padding()
                                        .foregroundColor(.blue)
                                        .onTapGesture {
                                            sheetSobre = true
                                        }
                                        .sheet(isPresented: $sheetSobre){
                                            SheetSobre()
                                        }
                                )
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
                        VStack(alignment: .leading){
                            Text("Galeria de fotos")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .bold()
                        }
                        .padding()
                        photosView().frame(width: 390, height: 300)
                    }
                    NavigationLink(destination: ContentView()){
                        Text("Mapa")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .bold()
                    }
                    
                    
                }.edgesIgnoringSafeArea(.top)
                    .background(.blue)
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                Explore()
                    .tabItem {
                        Label("", systemImage: "magnifyingglass")
                    }
                Favorito()
                    .tabItem {
                        Label("", systemImage: "heart")
                    }
                Perfil()
                    .tabItem {
                        Label("", systemImage: "person")
                    }
            }
        }
    }
}
