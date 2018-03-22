//
//  FeedTableViewCell.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import UIKit

final class FeedTableViewCell: UITableViewCell {
    @IBOutlet private weak var authorIconImageView: UIImageView!
    @IBOutlet private weak var authorNameLabel: UILabel!
    @IBOutlet private weak var createdAtLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var bodyLabel: UILabel!

    func configure(body: String, photo: UIImage?, createdAt: Date, authorName: String, authorIcon: UIImage) {
        authorIconImageView.image = authorIcon
        authorNameLabel.text = authorName

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        createdAtLabel.text = dateFormatter.string(from: createdAt)

        photoImageView.image = photo
        photoImageView.isHidden = photo == nil

        bodyLabel.text = body
    }
}
