//
//  PostRepository.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import RxSwift

// swiftlint:disable force_unwrapping

struct PostRepository {
    func load() -> Single<[Post]> {
        // TODO
        let posts = [
            Post(
                id: 3,
                body: "僕のかわいいエリザベスの写真です！",
                photo: Bundle.main.url(forResource: "post_1", withExtension: "png")!,
                createdAt: Date(timeIntervalSince1970: 1521860400),
                authorName: "yutu",
                authorIcon: Bundle.main.url(forResource: "user_icon_1", withExtension: "png")!
            ),
            Post(
                id: 2,
                body: "僕のかわいいポン吉の写真です！僕のかわいいポン吉の写真です！僕のかわいいポン吉の写真です！",
                photo: Bundle.main.url(forResource: "post_2", withExtension: "png")!,
                createdAt: Date(timeIntervalSince1970: 1521770400),
                authorName: "yutu",
                authorIcon: Bundle.main.url(forResource: "user_icon_1", withExtension: "png")!
            ),
            Post(
                id: 1,
                body: "今日はドッグランに行ってきました！エリザベスもポン吉もいっぱい走りました！",
                photo: nil,
                createdAt: Date(timeIntervalSince1970: 1521680400),
                authorName: "yutu",
                authorIcon: Bundle.main.url(forResource: "user_icon_1", withExtension: "png")!
            )
        ]

        return Single<[Post]>
            .just(posts)
            .delay(0.1, scheduler: MainScheduler.instance)
    }
}
