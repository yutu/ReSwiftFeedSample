//
//  FeedStub.swift
//  ReSwiftFeedSampleTests
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import OHHTTPStubs

final class FeedStub: WebAPIEndpointStub {
    let path = "/feed"
}

final class Post1ImageStub: ImageStub {
    let path = "/post_1.png"
}

final class Post2ImageStub: ImageStub {
    let path = "/post_2.png"
}

final class AuthorIconImageStub: ImageStub {
    let path = "/user_icon_1.png"
}
