//
//  PostNetworkingRepository.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

struct PostNetworkingRepository: PostRepository {
    private let session: APIKit.Session

    init(session: APIKit.Session) {
        self.session = session
    }

    func feed() -> Single<[Post]> {
        return session.rx.response(FeedRequest())
            .map { $0.posts }
            .asSingle()
    }
}
