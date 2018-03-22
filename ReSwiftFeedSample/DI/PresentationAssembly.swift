//
//  PresentationAssembly.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

// swiftlint:disable force_unwrapping

struct PresentationAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(FeedViewController.self) { r, c in
            c.store = r.resolve(AppStore.self)!
            c.load = ShowFeed.load(postRepository: r.resolve(PostRepository.self)!)
        }
    }
}
