//
//  ShowFeed.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import ReSwift

typealias Post = (body: String, photo: UIImage?, createdAt: Date, authorName: String, authorIcon: UIImage)

struct ShowFeed {}

// MARK: - ShowFeed - State

extension ShowFeed {
    struct State: StateType {
        enum LoadingStatus {
            case idle
            case loading
        }

        var loadingStatus: LoadingStatus
        var posts: [Post]
        var error: Error?

        static var initial: State {
            return State(loadingStatus: .idle, posts: [], error: nil)
        }
    }
}

// MARK: - ShowFeed - Action

extension ShowFeed {
    enum Action: ReSwift.Action {
        case loading
        case succeedLoading(posts: [Post])
        case failLoading(error: Error)
    }

    static func load() -> ActionCreator {
        return { (state, store) in
            // TODO
            let posts = [
                Post(body: "僕のかわいいエリザベスの写真です！", photo: #imageLiteral(resourceName: "post_1"), createdAt: Date(timeIntervalSince1970: 1521860400), authorName: "yutu", authorIcon: #imageLiteral(resourceName: "user_icon_1")),
                Post(body: "僕のかわいいポン吉の写真です！僕のかわいいポン吉の写真です！僕のかわいいポン吉の写真です！", photo: #imageLiteral(resourceName: "post_2"), createdAt: Date(timeIntervalSince1970: 1521770400), authorName: "yutu", authorIcon: #imageLiteral(resourceName: "user_icon_1")),
                Post(body: "今日はドッグランに行ってきました！エリザベスもポン吉もいっぱい走りました！", photo: nil, createdAt: Date(timeIntervalSince1970: 1521680400), authorName: "yutu", authorIcon: #imageLiteral(resourceName: "user_icon_1"))
            ]

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                store.dispatch(Action.succeedLoading(posts: posts))
            }

            return Action.loading
        }
    }
}

// MARK: - ShowFeed - Reducer

extension ShowFeed {
    static var reducer = { (action: ReSwift.Action, state: State?) -> State in
        var state = state ?? State.initial

        switch action {
        case Action.loading:
            state.loadingStatus = .loading
        case Action.succeedLoading(let posts):
            state.loadingStatus = .idle
            state.posts = posts
        case Action.failLoading(let error):
            state.loadingStatus = .idle
            state.error = error
        default:
            break
        }

        return state
    }
}
