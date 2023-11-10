//
//  photosView.swift
//  final
//
//  Created by Pablo on 03/11/23.
//

import SwiftUI

struct Place: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imgURL: String
}
struct photosView: View {
    let places = [
        Place(name: "Museu Lauro da Escóssia", imgURL: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Museu_Municipal_Jornalista_Lauro_da_Esc%C3%B3ssia%2C_Mossor%C3%B3_%28RN%29.jpg"),
        Place(name: "Memorial da Resistência", imgURL: "https://mossoro.rn.gov.br/userfiles/files/WhatsApp%20Image%202022-11-16%20at%2012_49_10%20(1).jpeg"),
        Place(name: "Museu do Petróleo", imgURL: "https://vaconferir.com.br/wp-content/uploads/2013/11/20180904_094532-1024x768.jpg"),
        Place(name: "Teatro Municipal Dix-Huit Rosado", imgURL: "https://upload.wikimedia.org/wikipedia/commons/8/80/Teatro_Municipal_Dix-Huit_Rosado%2C_Mossor%C3%B3_%28RN%29.jpg"),
        Place(name: "Teatro Lauro Monte Filho", imgURL: "https://mossoronoticias.com.br/adm/midia/image/a8532085490.webp")
    ]
    
    var body: some View {
        VStack{
            TabView{
                ForEach(places, id: \.self) { place in
                    VStack {
                        AsyncImage(url: URL(string: place.imgURL)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 300, height: 200)
                        .cornerRadius(10)
                        .padding()
                        Text(place.name)
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct photosView_Previews: PreviewProvider {
    static var previews: some View {
        photosView()
    }
}
