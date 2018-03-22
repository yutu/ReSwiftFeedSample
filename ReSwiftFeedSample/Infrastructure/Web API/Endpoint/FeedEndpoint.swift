//
//  FeedEndpoint.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct FeedRequest: Request {
    struct Response: Himotoki.Decodable {
        let posts: [Post]

        public static func decode(_ e: Extractor) throws -> Response {
            return try Response(
                posts: Himotoki.decodeArray(e.rawValue)
            )
        }
    }

    var method: APIKit.HTTPMethod {
        return .get
    }

    var path: String {
        return "/feed"
    }
}
