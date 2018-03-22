//
//  Post.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import UIKit

struct Post: Equatable {
    let id: Int
    let body: String
    let photo: UIImage?
    let createdAt: Date
    let authorName: String
    let authorIcon: UIImage
}

// MARK: - Equatable

func == (lhs: Post, rhs: Post) -> Bool {
    return lhs.id == rhs.id
}
