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

final class FeedViewControllerSpec: QuickSpec {
    override func spec() {
        describe("FeedViewController") {
            var window: UIWindow!

            beforeEach {
                window = UIWindow()
                window.makeKeyAndVisible()
                let viewController: UIViewController! = UIStoryboard(name: "Feed", bundle: Bundle(for: AppDelegate.self)).instantiateInitialViewController()
                window.addSubview(viewController.view)
            }

            afterEach {
                window = nil
            }

            context("when returns feed") {
                beforeEach {
                    var frame = window.frame
                    frame.size.height = 1000
                    window.frame = frame
                }

                it("displays correctly") {
                    //📷(window)
                    expect(window).to(haveValidSnapshot())
                }
            }
        }
    }
}
