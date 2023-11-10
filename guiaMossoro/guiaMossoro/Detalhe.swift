import SwiftUI

struct Detalhe: View {
    @State private var isFavorited = false
    let images = ["Image", "Teste", "Teste", "Teste"]
    let local: Local
    
    init(local: Local) {
        self.local = local
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.blue.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .center) {
                        TabView {
                            ForEach(local.imagens ?? [], id: \.self) { imageUrl in
                                AsyncImage(url: URL(string: imageUrl)){ image in
                                    image.resizable().aspectRatio(contentMode: .fill)
                                }
                            placeholder: {
                                ProgressView()
                            }
                                // AsyncImage(url: URL(string: local.imagens![0]))
                            }
                         
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .frame(height: 400)
                        .padding(.top, -60)

                        HStack {
                            VStack(alignment: .leading) {
                                Text(local.nome ?? "") // Nome do local
                                    .font(.title)
                                    .multilineTextAlignment(.leading)
                                    .bold()
                                    .foregroundColor(Color.white)
                                  //  .padding(.leading, -50.0)
                                
                                Text(local.categoria ?? "") // Categoria do local
                                    .foregroundColor(Color.white)
                                 
                                
                                
                            }
                            //.padding(/*@START_MENU_TOKEN@*/.leading, 40.0/*@END_MENU_TOKEN@*/)
                            Spacer()
                            VStack{
                                Button {
                                    isFavorited.toggle()
                                } label: {
                                    Image(systemName: isFavorited ? "suit.heart.fill" : "suit.heart")
                                        .foregroundColor(Color.white)
                                        .padding(.trailing)
                                        .font(.system(size: 30))
                                }
                                
                                Text(String(local.curtidas!).replacingOccurrences(of: ",", with: "")).foregroundColor(.white)

                            }
                            
                        }
                        .padding()
                        
                        Text(local.horario ?? "") // Horário do local
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.leading, 0.0)
                            .frame(width: geometry.size.width * 0.95)

                        Spacer()
                        Text("Localizacao:") // Título da localização
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.leading, -34.0)
                            .frame(width: geometry.size.width * 0.90)

                        Text(local.endereco.rua ?? "") // Rua do endereço
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.horizontal, 5.0)
                            .frame(width: geometry.size.width * 0.95)
                            .padding()

                        Button {
                            // Aqui vai ficar a acao ao entrar no mapa
                        } label: {
                            HStack {
                                Image(systemName: "mappin")
                                Text("Visualizar localização no mapa")
                                    .foregroundColor(Color.black)
                                    .cornerRadius(70.0)
                            }
                            .frame(width: geometry.size.width * 0.8, height: 50.0)
                            .fixedSize()
                        }
                        .background(Color.white)
                    }
                }
            }
        }
    }
}

struct Detalhe_Previews: PreviewProvider {
    static var previews: some View {
        let sampleLocal = Local(nome: "Exemplo", descricao: "Descrição de exemplo", coordenadas: nil, imagens: nil, endereco: Endereco(rua: "Rua de exemplo", numero: "123", bairro: "Bairro de exemplo", cep: "12345-678"), categoria: "Categoria de exemplo", horario: "Horário de exemplo", curtidas: 0)
        return Detalhe(local: sampleLocal)
    }
}
