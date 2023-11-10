//
//  Categoria.swift
//  guiaMossoro
//
//  Created by Student05 on 08/11/23.
//

import SwiftUI

struct Categoria: View {
    var categoriaRecebida: String = ""
    @State private var searchWord = "..."
    @StateObject var viewModel = ViewModel()
    var body: some View {
        GeometryReader{ geometry in
            ScrollView{
                NavigationStack{
                    VStack{
                        Text("\(categoriaRecebida)s da região")
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
                        Text("Melhores \(categoriaRecebida)s")
                            .padding()
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
                    .padding(.all,20)
                }
            }
        }
        .onAppear(){
            viewModel.fetchLocaisPorCategoria(categoria: categoriaRecebida)
        }
    }
    func filtrar(){
        if(searchWord == ""){
            viewModel.fetchLocaisPorCategoria(categoria: categoriaRecebida)
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

struct Categoria_Previews: PreviewProvider {
    static var previews: some View {
        Categoria()
    }
}
