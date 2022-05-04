//
//  NewsTableViewController.swift
//  RxNews
//
//  Created by JeongminKim on 2022/05/04.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    
    private var articleListVM: ArticleListViewModel!
    
    private var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateNews()
    }
    
    private func populateNews() {
        URLRequest.load(resource: ArticlesResponse.all)
            .subscribe(onNext: { [weak self] result in
                let articles = result.articles
                self?.articleListVM = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.articlesVM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }

        let articleVM = self.articleListVM.articleAt(indexPath.row)
        cell.config(articleVM)
        return cell
    }
}
