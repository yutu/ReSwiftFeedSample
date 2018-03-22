//
//  ApplicationAssembly.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import Swinject

struct ApplicationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppStore.self) { _ in
            AppStore(
                reducer: appReducer,
                state: nil
            )
        }.inObjectScope(.container)
    }
}
