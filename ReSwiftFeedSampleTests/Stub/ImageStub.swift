//
//  ImageStub.swift
//  ReSwiftFeedSampleTests
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import OHHTTPStubs

protocol ImageStub: HTTPStub {
}

extension ImageStub {
    var filePath: String {
        return (path as NSString).lastPathComponent
    }

    var responseHeaders: [AnyHashable: Any] {
        let fileExtension = (path as NSString).pathExtension

        switch fileExtension {
        case "png":
            return ["Content-Type": "image/png"]
        case "jpg":
            return ["Content-Type": "image/jpeg"]
        case "gif":
            return ["Content-Type": "image/gif"]
        default:
            return [:]
        }
    }
}
