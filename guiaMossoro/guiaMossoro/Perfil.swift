//
//  Perfil.swift
//  guiaMossoro
//
//  Created by Student05 on 30/10/23.
//

import SwiftUI

struct Perfil: View {
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                VStack{
                    VStack{
                        Spacer()
                        AsyncImage(url: URL(string: "https://instagram.frec10-1.fna.fbcdn.net/v/t51.2885-19/357651814_1020457595975817_5477008518553081592_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.frec10-1.fna.fbcdn.net&_nc_cat=109&_nc_ohc=g7CHG3ByRWEAX8naCX7&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDaoLY85BhHZrNkfLTVpIZQ7sVqcBaLnJ6lWOkXkUTyhw&oe=654E08AB&_nc_sid=8b3546")){ image in
                            image
                                .resizable()
                                .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.2)
                                .clipShape(Circle())
                                .padding(.vertical, geometry.size.height * 0.01)
                            
                        } placeholder: {
                            ProgressView()
                        }
                        Text("Joao Sales")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical, geometry.size.height * 0.005)
                        Text("JoaoSales@hotmail.com")
                            .accentColor(.white)
                            .font(.title2)
                            .padding(.bottom,geometry.size.height * 0.05)
                        
                        HStack{
                            Image(systemName: "key")
                                .padding(.all)
                            Text("Alterar Senha")
                                .font(.title3)
                            Spacer()
                        }
                        .onTapGesture {
                            //
                        }
                        .frame(width: geometry.size.width * 0.5)
                        .background(.white)
                        .cornerRadius(15)
                        .padding(.bottom, geometry.size.height * 0.05)
                        
                        
                        HStack{
                            Image(systemName: "rectangle.righthalf.inset.fill.arrow.right")
                                .padding(.all)
                            Text("Sair")
                                .font(.title3)
                            Spacer()
                        }
                        .onTapGesture {
                            //
                        }
                        .frame(width: geometry.size.width * 0.5)
                        .background(.white)
                        .cornerRadius(15)
                        Spacer()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.9)
                .padding(.top)
                .background(LinearGradient(stops: [
                    Gradient.Stop(color: .white, location: 0.05),
                    Gradient.Stop(color: .blue, location: 0.25),
                ], startPoint: .top, endPoint: .bottom))
                .cornerRadius(15)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}
