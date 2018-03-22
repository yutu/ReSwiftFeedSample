//
//  Transformer.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import Foundation
import Himotoki

struct Transformer {
    static let url = Himotoki.Transformer<String, URL> { value throws -> URL in
        guard let URL = URL(string: value) else {
            throw customError("Invalid URL string: \(value)")
        }

        return URL
    }

    static let dateTime = Himotoki.Transformer<String, Date> { value throws -> Date in
        guard let dateTime = Date(fromISO8601: value) else {
            throw customError("Invalid date time string: \(value)")
        }

        return dateTime
    }
}

extension Date {
    private static let ISO8601Formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        return dateFormatter
    }()

    init?(fromISO8601 string: String) {
        guard let date = Date.ISO8601Formatter.date(from: string) else {
            return nil
        }
        self = date
    }
}
