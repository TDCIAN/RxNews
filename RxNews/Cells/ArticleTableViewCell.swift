//
//  ArticleTableViewCell.swift
//  RxNews
//
//  Created by JeongminKim on 2022/05/04.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleTableViewCell: UITableViewCell {
    static let identifier = "ArticleTableViewCell"
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func config(_ viewModel: ArticleViewModel) {
        viewModel.title.asDriver(onErrorJustReturn: "No title")
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.description.asDriver(onErrorJustReturn: "No description")
            .drive(descriptionLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
