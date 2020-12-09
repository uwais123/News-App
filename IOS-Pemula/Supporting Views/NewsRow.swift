//
//  Cells.swift
//  IOS-Pemula
//
//  Created by Uwais Alqadri on 07/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct NewsRow: View {
    @State private var isShareSheetShowing = false
    var news: News
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                WebImage(url: URL(string: news.image), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 348,height: 200)
                    .clipped()
            }
            
            Text(news.title)
                .font(.headline)
                .bold()
                .padding(5)
            
            Text(news.description)
                .lineLimit(2)
                .font(.subheadline)
                .padding(5)
            
            HStack {
                Text(news.publishedAt)
                    .padding(5)
                    .font(.caption2)
                
                Spacer()
                
                Button(action: shareNews, label: {
                    Image(systemName: "square.and.arrow.up")
                        .padding(.trailing)
                        .foregroundColor(.blue)
                })
            }
            .padding(.bottom)
            .padding(.top)
        }
        .cornerRadius(25)
        .clipped()
    }
    
    func shareNews() {
        isShareSheetShowing.toggle()
        
        let url = URL(string: news.url)
        let av = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?
            .present(av, animated: true, completion: nil)
        
    }
}


//struct NewsRow_Previews: PreviewProvider {
//    @ObservedObject var list = Data()
//    static var previews: some View {
//        NewsRow(news: list)
//            .previewLayout(.sizeThatFits)
//    }
//}
