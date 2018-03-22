//
//  ContainerProvider.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import Swinject

struct ContainerProvider {
    static var `default`: Container = createDefaultContainer

    private static var createDefaultContainer: Container {
        let container = Container()
        assemblies.forEach { $0.assemble(container: container) }
        return container
    }

    private static var assemblies: [Assembly] {
        return [
            PresentationAssembly(),
            ApplicationAssembly(),
            InfrastructureAssembly()
        ]
    }
}
