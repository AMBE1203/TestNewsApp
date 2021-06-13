//
//  FeedView.swift
//  TestNewsApp
//
//  Created by Admin on 13/06/2021.
//

import SwiftUI
import Combine

struct FeedView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        
        NavigationView {
            Group{
                switch viewModel.state {
//                case .loading:
//                    ProgressView()
              
                case .failed(let error):
                    ErrorView(error: error, handler: viewModel.getArticles)
                default:
                    List(viewModel.isLoading ? Article.dummyData : viewModel.articles) {
                            item in
                        ArticleView(isLoading: viewModel.isLoading, article: item)
                                .onTapGesture {
                                    load(url: item.url)
                                }
                        }
                        .navigationTitle(Text("News"))
                }
                
            }.onAppear(perform: viewModel.getArticles)

        }
        
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else {
            return
        }
        
        openUrl(url)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
