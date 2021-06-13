//
//  NewsResponse.swift
//  TestNewsApp
//
//  Created by Admin on 10/06/2021.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable, Equatable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable, Equatable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData : [Article] {
        [
            .init(author: "Matt Egan, CNN Business",
                  url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                  source: "CNN",
                  title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                  articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                  image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                  date: Date()),
            .init(author: "Matt Egan, CNN Business",
                  url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                  source: "CNN",
                  title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                  articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                  image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                  date: Date()),
            .init(author: "Matt Egan, CNN Business",
                                         url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                         source: "CNN",
                                         title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                         articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                         image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                         date: Date()),
            .init(author: "Matt Egan, CNN Business",
                                                                url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                                                source: "CNN",
                                                                title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                                                articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                                                image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                                                date: Date()),
            .init(author: "Matt Egan, CNN Business",
                                                                                       url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                                                                       source: "CNN",
                                                                                       title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                                                                       articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                                                                       image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                                                                       date: Date()),   .init(author: "Matt Egan, CNN Business",
                                                                                                              url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                                                                                              source: "CNN",
                                                                                                              title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                                                                                              articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                                                                                              image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                                                                                              date: Date()),   .init(author: "Matt Egan, CNN Business",
                                                                                                                                     url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                                                                                                                     source: "CNN",
                                                                                                                                     title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                                                                                                                     articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                                                                                                                     image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                                                                                                                     date: Date()),   .init(author: "Matt Egan, CNN Business",
                                                                                                                                                            url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                                                                                                                                            source: "CNN",
                                                                                                                                                            title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                                                                                                                                            articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                                                                                                                                            image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                                                                                                                                            date: Date()),   .init(author: "Matt Egan, CNN Business",
                                                                                                                                                                                   url: "https://www.cnn.com/2021/06/09/energy/keystone-pipeline-canceled/index.html",
                                                                                                                                                                                   source: "CNN",
                                                                                                                                                                                   title: "Developer pulls the plug on Keystone XL oil pipeline - CNN ",
                                                                                                                                                                                   articleDescription: "The developer of the Keystone XL pipeline announced Wednesday it is pulling the plug on the controversial project after the Biden administration revoked its permit in January.",
                                                                                                                                                                                   image: "https://cdn.cnn.com/cnnnext/dam/assets/210609173329-01-keystone-pipes-north-dakota-file-super-tease.jpg",
                                                                                                                                                                                   date: Date()),
            
        ]
    }
}
