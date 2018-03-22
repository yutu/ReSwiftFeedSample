//
//  PostRepository.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import RxSwift

protocol PostRepository {
    func feed() -> Single<[Post]>
}
