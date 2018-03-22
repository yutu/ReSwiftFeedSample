//
//  Request.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

protocol Request: APIKit.Request {}

extension Request {
    var baseURL: URL {
        return URL(string: "https://api.sample.com")! // swiftlint:disable:this force_unwrapping
    }
}

extension Request where Response: Himotoki.Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}
