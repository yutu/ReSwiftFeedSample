//
//  InfrastructureAssembly.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import APIKit
import Swinject

// swiftlint:disable force_unwrapping

struct InfrastructureAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PostRepository.self) { r in
            PostNetworkingRepository(session: r.resolve(APIKit.Session.self)!)
        }

        container.register(APIKit.Session.self) { r in
            APIKit.Session(adapter: r.resolve(URLSessionAdapter.self)!)
        }

        container.register(URLSessionAdapter.self) { _ in
            URLSessionAdapter(configuration: URLSessionConfiguration.default)
        }
    }
}
