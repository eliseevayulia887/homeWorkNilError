//
//  NetworkManadger.swift
//  p6m3work1
//
//  Created by Олег Елисеев on 02.03.2024.
//

import Foundation

class NetworkManadger{
    
    
    func getNews(q: String) {
        
        var urlComponetns = URLComponents()
        urlComponetns.scheme = "https"
        urlComponetns.host = "newsapi.org"
        urlComponetns.path = "/v2/everything"
        
        urlComponetns.queryItems = [
            URLQueryItem(name: "q", value: "q"),
            URLQueryItem(name: "apiKey", value: "a1957fb967374631a5b3394dba1ea716"),
            URLQueryItem(name: "pageSize", value: "20"),
            URLQueryItem(name: "language", value: "ru"),
            URLQueryItem(name: "searchIn", value: "content"),
            URLQueryItem(name: "from", value: "2024-03-01"),
            URLQueryItem(name: "to", value: "2024-03-02"),
            URLQueryItem(name: "sortBy", value: "popularity")
            
        ]
        
        guard let url = urlComponetns.url else { return }
        
        let req = URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: req) { data, res, err in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            
            if let jsonData = data{
                let res = try? JSONDecoder().decode(Responce.self, from: jsonData)
                print(res)
            }
            
        }.resume()
    }
}

struct Responce: Decodable{
    let status: String
    let totalResults: Int
}
