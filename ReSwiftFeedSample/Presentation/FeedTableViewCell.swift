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

    func configure(post: Post) {
        authorIconImageView.image = post.authorIcon
        authorNameLabel.text = post.authorName

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        createdAtLabel.text = dateFormatter.string(from: post.createdAt)

        photoImageView.image = post.photo
        photoImageView.isHidden = post.photo == nil

        bodyLabel.text = post.body
    }
}
