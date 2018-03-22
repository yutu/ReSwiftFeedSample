//
//  Post+Decodable.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import Himotoki

extension Post: Himotoki.Decodable {
    public static func decode(_ e: Extractor) throws -> Post {
        return try Post(
            id: e <| "id",
            body: e <| "body",
            photo: Transformer.url.apply(e <|? "photo"),
            createdAt: Transformer.dateTime.apply(e <| "created_at"),
            authorName: e <| "author_name",
            authorIcon: Transformer.url.apply(e <| "author_icon")
        )
    }
}
