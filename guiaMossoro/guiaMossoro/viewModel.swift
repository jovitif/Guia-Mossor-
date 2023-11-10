//
//  viewModel.swift
//  guiaMossoro
//
//  Created by Student05 on 30/10/23.
//

import Foundation

// model : Local


struct Local: Codable, Hashable, Comparable{
    var nome: String?
    var descricao: String?
    var coordenadas: Coordenada?
    var imagens: [String]?
    var endereco: Endereco
    var categoria: String?
    var horario: String?
    var curtidas: Int?
    
    static func ==(lhs: Local, rhs: Local) -> Bool {
            return lhs.curtidas == rhs.curtidas
        }

    static func <(lhs: Local, rhs: Local) -> Bool {
            return lhs.curtidas! < rhs.curtidas!
    }
    static func >(lhs: Local, rhs: Local) -> Bool {
            return lhs.curtidas! > rhs.curtidas!
    }

}

struct Coordenada: Codable,Hashable{
    var latitude: Double?
    var longitude: Double?
}

struct Endereco: Codable, Hashable{
    var rua: String?
    var numero: String?
    var bairro: String?
    var cep: String?
}


struct Usuario: Decodable{
    var username: String?
    var senha: String?
    var locaisfavoritos: [String]?
}



class ViewModel:ObservableObject{
    @Published var locais: [Local] = []
    @Published var usuario: Usuario = Usuario()
    func fetchLocais(){
        // url
        guard let url = URL(string: "http://192.168.128.31:1880/getLocais") else{
            return
        }
        
        // criar task - decodificar o JSON (JSON.decoder())
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
    
            do{
                var parsed = try JSONDecoder().decode([Local].self, from: data)
                DispatchQueue.main.async {
                    parsed.sort(by: >)
                    self?.locais = parsed
                }
                
            }
            catch{
                print(error)
            }
    }
        task.resume()
    }
    
    
    func fetchLocaisPorCategoria(categoria: String){
        // url
        guard let url = URL(string: "http://192.168.128.31:1880/getLocais") else{
            return
        }
        
        // criar task - decodificar o JSON (JSON.decoder())
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
    
            do{
                let parsed = try JSONDecoder().decode([Local].self, from: data)
                DispatchQueue.main.async {
                    self?.locais = parsed.filter{ local in
                        if(local.categoria == categoria){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                }
                
            }
            catch{
                print(error)
            }
    }
        task.resume()
    }
    
    func fetchLocaisPorNome(nome: String){
        // url
        guard let url = URL(string: "http://192.168.128.31:1880/getLocais") else{
            return
        }
        
        // criar task - decodificar o JSON (JSON.decoder())
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
    
            do{
                let parsed = try JSONDecoder().decode([Local].self, from: data)
                DispatchQueue.main.async {
                    self?.locais = parsed.filter{ local in
                        if(local.nome == nome){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                }
                
            }
            catch{
                print(error)
            }
    }
        task.resume()
    }
    
    
    func fetchLocal(nome: String){
        // url
        guard let url = URL(string: "http://192.168.128.31:1880/getLocais") else{
            return
        }
        
        // criar task - decodificar o JSON (JSON.decoder())
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
    
            do{
                let parsed = try JSONDecoder().decode([Local].self, from: data)
                DispatchQueue.main.async {
                    self?.locais = parsed.filter{ local in
                        if(local.nome == nome){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                }
                
            }
            catch{
                print(error)
            }
    }
        task.resume()
    }
    
    
    func fetchLocaisPorNome(nomes: [String]?){
        // url
        guard let url = URL(string: "http://192.168.128.31:1880/getLocais") else{
            return
        }
        
        // criar task - decodificar o JSON (JSON.decoder())
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
    
            do{
                let parsed = try JSONDecoder().decode([Local].self, from: data)
                DispatchQueue.main.async {
                    var arr : [Local] = []
                    for nome in nomes!{
                        for local in parsed{
                            if(nome == local.nome){
                                arr.append(local)
                            }
                        }
                    }
                    self?.locais = arr
                }
                
            }
            catch{
                print(error)
            }
    }
        task.resume()
    }
    
    
    func fetchUsuario(){
        // url
        guard let url = URL(string: "http://192.168.128.31:1880/getUsers") else{
            return
        }
        
        // criar task - decodificar o JSON (JSON.decoder())
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
    
            do{
                let parsed = try JSONDecoder().decode([Usuario].self, from: data)
                DispatchQueue.main.async {
                    self?.usuario = parsed[0]
                    self?.fetchLocaisPorNome(nomes: self?.usuario.locaisfavoritos!)
                }
                
            }
            catch{
                print(error)
            }
    }
        task.resume()
    }
    
}
