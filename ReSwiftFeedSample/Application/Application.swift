//
//  Application.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import ReSwift

final class AppStore: Store<AppState> {
}

typealias ActionCreator = AppStore.ActionCreator
typealias AsyncActionCreator = AppStore.AsyncActionCreator

struct AppState: StateType {
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState()
}
