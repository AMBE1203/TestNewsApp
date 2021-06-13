//
//  ArticleView.swift
//  TestNewsApp
//
//  Created by Admin on 10/06/2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    @State var isLoading: Bool
    
    let  article: Article
    
    
    var body: some View {
        HStack {
            if let imgUrl = article.image,
               let url = URL(string: imgUrl){
                URLImage( url,identifier: article.id.uuidString,failure: { error, _ in
                    PlacerViewHolder()
                    
                }, content: {
                    image in image.resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).cornerRadius(10)
            } else {
                PlacerViewHolder()
                
            }
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title ?? "")
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                if let date = article.date {
                    HStack(spacing: 4) {
                        Text(date, style: .date)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                        Text(date, style: .time)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
                
                
            })
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

struct PlacerViewHolder: View {
    var body: some View {
        Image(systemName:"photo.fill").foregroundColor(.white).background(Color.gray)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).cornerRadius(10)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading: false, article: Article.dummyData.first!).previewLayout(.sizeThatFits)
    }
}
