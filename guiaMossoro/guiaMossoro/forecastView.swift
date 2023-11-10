//
//  forecastView.swift
//  final
//
//  Created by Pablo on 07/11/23.
//

import SwiftUI

struct forecastView: View {
    @StateObject var fetchData = FetchData()
    
    var body: some View {
        //let weatherData = fetchData.weatherData
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.blue)
            VStack {
               if let weatherData = fetchData.weatherData {
                   VStack{
                       Rectangle()
                           .foregroundColor(.white)
                           .frame(width: 360, height: 350)
                           .cornerRadius(15)
                           .shadow(radius: 10)
                           .overlay(
                            VStack{
                                AsyncImage(url: URL(string: "https:" + fetchData.weatherData!.current.condition.icon)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 160)
                                } placeholder: {
                                    ProgressView()
                                }
                                HStack{
                                    Text("Mossoró")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                        .fontWeight(.semibold)
                                    Image(systemName: "location.fill")
                                        .foregroundColor(.blue)
                                        //.bold()
                                }
                                Text("\(Int(weatherData.current.temp_c))˚")
                                    .font(Font.custom("Helvetica Neue", size: 90))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.blue)
                                
                            }
                           )
                   }
                   .padding()
                   VStack{
                       Rectangle()
                           .foregroundColor(.white)
                           .frame(width: 360, height: 80)
                           .cornerRadius(15)
                           .shadow(radius: 10)
                           .overlay(
                            VStack{
                                HStack{
                                    Image(systemName: "humidity")
                                    Text("Umidade: \(weatherData.current.humidity)%")
                                    Spacer()
                                    Image(systemName: "wind")
                                    Text("Vento: \(Int(weatherData.current.wind_mph))mph")
                                }.foregroundColor(.blue)
                                //.padding()
                                Spacer()
                                HStack{
                                    Image(systemName: "water.waves.and.arrow.up")
                                    Text("Pressão: \(Int(weatherData.current.pressure_mb))atm")
                                    Spacer()
                                    Image(systemName: "thermometer.sun.fill")
                                    Text("Sensação: \(Int(weatherData.current.feelslike_c))˚")
                                }.foregroundColor(.blue)
                                //.padding()
                            }
                                .padding()
                                .foregroundColor(.white)
                                .bold()
                           )
                   }
                   
                } else {
                    Text("...")
                }
            }.onAppear() {
                fetchData.getData()
                
            }
        }
    }
}

struct forecastView_Previews: PreviewProvider {
    static var previews: some View {
        forecastView()
    }
}
