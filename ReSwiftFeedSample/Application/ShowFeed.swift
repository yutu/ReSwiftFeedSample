//
//  ShowFeed.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import ReSwift

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

    static func load(postRepository: PostRepository) -> ActionCreator {
        return { (state, store) in
            _ = postRepository.feed().subscribe(onSuccess: { (posts) in
                store.dispatch(Action.succeedLoading(posts: posts))
            }, onError: { (error) in
                store.dispatch(Action.failLoading(error: error))
            })

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
