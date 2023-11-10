//
//  Explore.swift
//  guiaMossoro
//
//  Created by Student05 on 30/10/23.
//

import SwiftUI

struct Explore: View {
    @State var searchWord: String = "..."
    @StateObject var viewModel = ViewModel()
    let categorias = ["Restaurante" : "fork.knife", "Shopping" : "bag", "Hotel": "building", "Hospital" : "cross", "Ponto historico" : "book", "Supermercado" : "cart"]
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                NavigationStack{
                    VStack{
                        Text("Encontre seu destino")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            TextField("Search...", text: $searchWord)
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.05, height: geometry.size.height * 0.025)
                            }
                            .onTapGesture(){
                                filtrar()
                            }
                        }
                        .border(.black)
                        VStack{
                            Text("Categorias")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ForEach(categorias.sorted(by: >), id: \.key) { key, value in
                                        NavigationLink(destination: Categoria(categoriaRecebida: key)){
                                            VStack{
                                                Image(systemName: value)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.white)
                                                Text(key)
                                                    .foregroundColor(.white)
                                                    .font(.caption)
                                            }
                                            .frame(width: geometry.size.width * 0.28, height: geometry.size.height * 0.08)
                                            .padding(5)
                                            .padding(.vertical, 10)
                                            .background(.blue)
                                            .cornerRadius(15)
                                        }
                                    }
                                }
                            }
                            Text("Popular")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ForEach(viewModel.locais, id: \.self){ local in
                                        NavigationLink(destination: Detalhe(local: local)){
                                            VStack{
                                                AsyncImage(url: URL(string: local.imagens![0])){ image in
                                                    image
                                                        .resizable()
                                                        .frame(height: geometry.size.height * 0.2)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                VStack{
                                                    Text(local.nome!)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.bold)
                                                        .padding(.bottom, 5)
                                                    Text(local.descricao!)
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                        .padding(.bottom,1)
                                                    Text(local.categoria!)
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                    Spacer()
                                                }
                                            }
                                            .frame(width: geometry.size.width * 0.55, height: geometry.size.height * 0.4)
                                            .background(.blue)
                                            .cornerRadius(25)
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.all,20)
                }
            }
        }
        .onAppear(){
                viewModel.fetchLocais()
        }
    }
    
    func filtrar(){
        if(searchWord == ""){
            viewModel.fetchLocais()
        }
        else{
            viewModel.locais = viewModel.locais.filter{ local in
                if local.nome!.contains(searchWord){
                    return true
                }
                else{
                    return false
                }
            }
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
