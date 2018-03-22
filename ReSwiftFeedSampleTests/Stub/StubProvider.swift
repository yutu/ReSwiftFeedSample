//
//  StubProvider.swift
//  ReSwiftFeedSampleTests
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import OHHTTPStubs

final class StubProvider {
    private var stubDescriptors: [OHHTTPStubsDescriptor] = []
    private let stubs: [HTTPStub] = [
        FeedStub(),
        Post1ImageStub(),
        Post2ImageStub(),
        AuthorIconImageStub()
    ]

    func stub() {
        removeAllStubs()
        stubDescriptors = stubs.map { $0.stub() }
    }

    func removeAllStubs() {
        stubDescriptors.forEach { OHHTTPStubs.removeStub($0) }
        stubDescriptors = []
    }
}
