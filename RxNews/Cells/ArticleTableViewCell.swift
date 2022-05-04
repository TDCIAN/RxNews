//
//  ArticleTableViewCell.swift
//  RxNews
//
//  Created by JeongminKim on 2022/05/04.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    static let identifier = "ArticleTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
