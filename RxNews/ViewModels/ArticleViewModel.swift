//
//  ArticleViewModel.swift
//  RxNews
//
//  Created by JeongminKim on 2022/05/04.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}

struct ArticleViewModel {
    let article: Article

    var title: Observable<String> {
        return Observable<String>.just(article.title ?? "no title")
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "no description")
    }
    
    init(_ article: Article) {
        self.article = article
    }
}
