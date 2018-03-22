//
//  WebAPIEndpointStub.swift
//  ReSwiftFeedSampleTests
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import OHHTTPStubs

protocol WebAPIEndpointStub: HTTPStub {
}

extension WebAPIEndpointStub {
    var filePath: String {
        switch method {
        case .delete:
            return "no_content.json"
        default:
            let lastPathComponent = (path as NSString).lastPathComponent
            return "\(lastPathComponent)_\(method.rawValue).json"
        }
    }

    var responseHeaders: [AnyHashable: Any] {
        return ["Content-Type": "application/json"]
    }
}
