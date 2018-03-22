//
//  FeedViewControllerSpec.swift
//  ReSwiftFeedSampleTests
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
@testable import ReSwiftFeedSample
import Quick
import Nimble
import Nimble_Snapshots
import OHHTTPStubs

final class FeedViewControllerSpec: QuickSpec {
    override func spec() {
        describe("FeedViewController") {
            var window: UIWindow!
            var stubDescriptor: OHHTTPStubsDescriptor!
            var stubProvider: StubProvider!

            beforeEach {
                stubProvider = StubProvider()
                stubProvider.stub()

                window = UIWindow()
                window.makeKeyAndVisible()
                let viewController: UIViewController! = UIStoryboard(name: "Feed", bundle: Bundle(for: AppDelegate.self)).instantiateInitialViewController()
                window.addSubview(viewController.view)
            }

            afterEach {
                window = nil
                stubProvider.removeAllStubs()
            }

            context("when returns feed") {
                beforeEach {
                    var frame = window.frame
                    frame.size.height = 1000
                    window.frame = frame
                    RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.2))
                }

                it("displays correctly") {
                    //📷(window)
                    expect(window).to(haveValidSnapshot())
                }
            }
        }
    }
}
