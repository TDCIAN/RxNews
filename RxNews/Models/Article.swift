//
//  Article.swift
//  RxNews
//
//  Created by JeongminKim on 2022/05/04.
//

import Foundation

struct ArticlesResponse: Decodable {
    let articles: [Article]
}

extension ArticlesResponse {
    static var all: Resource<ArticlesResponse> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6d61b0036eb24a718896dca571428bc2")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
