//
//  HTTPStub.swift
//  ReSwiftFeedSampleTests
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import OHHTTPStubs

enum HTTPMethod: String {
    case get, post, put, patch, delete
}

protocol HTTPStub: class {
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String: String]? { get }
    var condition: OHHTTPStubsTestBlock { get }
    var filePath: String { get }
    var status: Int32 { get }
    var responseHeaders: [AnyHashable: Any] { get }
    var response: OHHTTPStubsResponse { get }
    var responseTime: TimeInterval { get }

    func stub() -> OHHTTPStubsDescriptor
}

extension HTTPStub {
    var method: HTTPMethod {
        return .get
    }

    var params: [String: String]? {
        return nil
    }

    var condition: OHHTTPStubsTestBlock {
        guard let params = params else {
            return pathMatches(path) && isMethod(method)
        }

        return pathMatches(path) && isMethod(method) && containsQueryParams(params)
    }

    private func isMethod(_ method: HTTPMethod) -> OHHTTPStubsTestBlock {
        switch method {
        case .get:
            return isMethodGET()
        case .post:
            return isMethodPOST()
        case .put:
            return isMethodPUT()
        case .patch:
            return isMethodPATCH()
        case .delete:
            return isMethodDELETE()
        }
    }

    var status: Int32 {
        switch method {
        case .get:
            return 200
        case .post:
            return 201
        case .put:
            return 200
        case .patch:
            return 200
        case .delete:
            return 204
        }
    }

    var response: OHHTTPStubsResponse {
        let resolvedfilePath = OHPathForFile(filePath, type(of: self))
        return fixture(filePath: resolvedfilePath!, status: status, headers: responseHeaders) // swiftlint:disable:this force_unwrapping
            .responseTime(responseTime)
    }

    var responseTime: TimeInterval {
        return 0
    }

    func stub() -> OHHTTPStubsDescriptor {
        return OHHTTPStubs.stubRequests(passingTest: condition, withStubResponse: { _ in self.response })
    }
}
