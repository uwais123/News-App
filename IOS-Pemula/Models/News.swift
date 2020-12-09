//
//  News.swift
//  IOS-Pemula
//
//  Created by Uwais Alqadri on 09/12/20.
//

import UIKit
import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct News: Identifiable {
    var id : String
    var title: String
    var description: String
    var image: String
    var url: String
    var publishedAt: String
    var content: String
}

class Data : ObservableObject {
    @Published var news = [News]()
    
    init() {
        let source = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=af402f5d5e474c80934424116991a975"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for articles in json["articles"] {
                let title = articles.1["title"].stringValue
                let id = articles.1["publishedAt"].stringValue
                let description = articles.1["description"].stringValue
                let urlToImage = articles.1["urlToImage"].stringValue
                let content = articles.1["content"].stringValue
                let url = articles.1["url"].stringValue
                
                DispatchQueue.main.async {
                    self.news.append(News(id: id, title: title, description: description, image: urlToImage, url: url, publishedAt: id, content: content))
                }
            }
            
        }.resume()
    }
}

