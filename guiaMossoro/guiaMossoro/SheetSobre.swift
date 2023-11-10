//
//  SheetSobre.swift
//  final
//
//  Created by Pablo on 02/11/23.
//

import SwiftUI

struct SheetSobre: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Role para o lado")
                    .fontWeight(.heavy)
                Image(systemName: "arrowshape.right.fill")
                ScrollView(.horizontal){
                    VStack{
                        HStack{
                            Rectangle()
                                .frame(width: 340, height: 370)
                                .foregroundColor(.white)
                                .shadow(radius: 8)
                                .overlay(
                                    VStack{
                                        AsyncImage(url: URL(string: "https://www.prefeiturademossoro.com.br/storage/posts/o6svmxfri9y9dn8arxqwxmd269mq1c.jpeg")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        Text("E aí, meu fi! Vou te contar um pouco sobre a cidade de Mossoró, que é conhecida como a Capital do Oeste e Cidade do Sal e do Petróleo. A cidade é tão quente que você pode fritar um ovo no asfalto! Mas não se preocupe, o povo de Mossoró é tão acolhedor que você vai se sentir em casa rapidinho.")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                        .padding()
                                )
                            Rectangle()
                                .frame(width: 340, height: 370)
                                .foregroundColor(.white)
                                .shadow(radius: 8)
                                .overlay(
                                    VStack{
                                        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/25/RN-mapa-Mossor%C3%B3.png")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        Text("Mossoró é a maior cidade do estado do Rio Grande do Norte e é famosa por sua produção de sal e petróleo. Fundada em 1852, Mossoró tem uma história rica e cheia de aventuras.")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                        .padding()
                                )
                            Rectangle()
                                .frame(width: 340, height: 370)
                                .foregroundColor(.white)
                                .shadow(radius: 8)
                                .overlay(
                                    VStack{
                                        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/51/Lampi%C3%A3o_em_Mossor%C3%B3.jpg")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        Text("Um dos momentos mais marcantes da nossa história foi quando a galera daqui botou pra correr o bando de Lampião. Isso mesmo, o famoso Rei do Cangaço tentou invadir a cidade, mas a galera daqui não deu mole e mandou ele e seu bando catar coquinho. É o tipo de história que faz você pensar: 'Essa galera aqui não é mole não!'.")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                        .padding()
                                )
                            Rectangle()
                                .frame(width: 340, height: 370)
                                .foregroundColor(.white)
                                .shadow(radius: 8)
                                .overlay(
                                    VStack{
                                        AsyncImage(url: URL(string: "https://aplbsindicato.org.br/wp-content/uploads/2022/02/WhatsApp-Image-2022-02-24-at-10.40.39.jpeg")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        Text("Outro momento histórico importante foi quando Mossoró se tornou a primeira cidade a dar o direito de voto às mulheres no Brasil. Isso mesmo, a Professora Celina Guimarães Viana foi a primeira mulher a votar no Brasil, em 1928, o que deu início a um movimento que culminou no reconhecimento oficial do sufrágio feminino pelo governo nacional em 1934.")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                        .padding()
                                )
                            Rectangle()
                                .frame(width: 340, height: 370)
                                .foregroundColor(.white)
                                .shadow(radius: 8)
                                .overlay(
                                    VStack{
                                        AsyncImage(url: URL(string: "https://scontent.fmvf1-1.fna.fbcdn.net/v/t1.6435-9/42666118_831588590298205_2629278845743661056_n.png?_nc_cat=102&ccb=1-7&_nc_sid=7f8c78&_nc_ohc=ybEW3U3b5QgAX_5VOd5&_nc_ht=scontent.fmvf1-1.fna&oh=00_AfAw-m3ZTOSeU9oiY187ubTYqoTfHhk9MujXRVym1aTJmA&oe=656C76B8")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        Text("E não para por aí, nós também fomos uma das primeiras cidades a abolir a escravidão no Brasil, cinco anos antes da Lei Áurea em 1888. É o tipo de atitude que faz você dizer: 'Essa galera aqui é arretada!'.")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                        .padding()
                                )
                            Rectangle()
                                .frame(width: 340, height: 370)
                                .foregroundColor(.white)
                                .shadow(radius: 8)
                                .overlay(
                                    VStack{
                                        AsyncImage(url: URL(string: "https://www.jornalfolharegional.com.br/wp-content/uploads/Mossor%C3%B3-Cidade-Junina.jpg")) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .scaledToFit()
                                        Text("Então é isso, essa é a história de Mossoró, uma cidade cheia de história, cultura e muita garra. E lembre-se: aqui o sol brilha forte, mas a hospitalidade do povo mossoroense brilha ainda mais!")
                                            .font(.subheadline)
                                            .fontWeight(.light)
                                            .multilineTextAlignment(.center)
                                    }
                                        .padding()
                                )
                        }
                        .padding()
                    }
                    .padding()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SheetSobre_Previews: PreviewProvider {
    static var previews: some View {
        SheetSobre()
    }
}
