//
//  NewsDetail.swift
//  IOS-Pemula
//
//  Created by Uwais Alqadri on 09/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetail: View {
    var news: News
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Detail")
                        .bold()
                        .font(.title)
                        .padding(.trailing)
                        .padding(.leading)
                    
                    Spacer()
                }
                
                WebImage(url: URL(string: news.image), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 334, height: 223)
                    .clipped()
                    .cornerRadius(9)
                    .padding()
                
                Text(news.title)
                    .bold()
                    .font(.title3)
                    .padding(.leading)
                    .padding(.trailing)
                
                Text(news.content)
                    .lineLimit(20)
                    .font(.subheadline)
                    .padding(5)
                    .padding(.leading)
                    .padding(.trailing)
                
                Link("View in Browser", destination: URL(string: news.url)!)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.top)
                    .padding(.horizontal)
                    .padding(.vertical)
                
                Spacer()
            }
        }
    }
}

