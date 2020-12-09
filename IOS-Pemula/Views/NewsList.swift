//
//  NewsList.swift
//  IOS-Pemula
//
//  Created by Uwais Alqadri on 07/12/20.
//

import SwiftUI

struct NewsList: View {
    
    @ObservedObject var list = Data()
    
    var body: some View {
        NavigationView {
            // tempat listnya nnti
            ScrollView {
                ForEach(list.news) { item in
                    VStack {
                        NavigationLink(
                            destination: NewsDetail(news: item)
                                .environmentObject(self.list)
                        ) {
                            NewsRow(news: item)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Text("News"))
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: Profile()) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .clipShape(Circle())
                            .padding(.top)
                            .padding(.bottom)
                    }
            )
        }
        .accentColor(.blue)
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
