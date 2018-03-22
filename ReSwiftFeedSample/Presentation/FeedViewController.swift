//
//  FeedViewController.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import UIKit

final class FeedViewController: UITableViewController {
    private var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        posts = [
            Post(body: "僕のかわいいエリザベスの写真です！", photo: #imageLiteral(resourceName: "post_1"), createdAt: Date(timeIntervalSince1970: 1521860400), authorName: "yutu", authorIcon: #imageLiteral(resourceName: "user_icon_1")),
            Post(body: "僕のかわいいポン吉の写真です！僕のかわいいポン吉の写真です！僕のかわいいポン吉の写真です！", photo: #imageLiteral(resourceName: "post_2"), createdAt: Date(timeIntervalSince1970: 1521770400), authorName: "yutu", authorIcon: #imageLiteral(resourceName: "user_icon_1")),
            Post(body: "今日はドッグランに行ってきました！エリザベスもポン吉もいっぱい走りました！", photo: nil, createdAt: Date(timeIntervalSince1970: 1521680400), authorName: "yutu", authorIcon: #imageLiteral(resourceName: "user_icon_1"))
        ]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if let cell = cell as? FeedTableViewCell {
            cell.configure(post: posts[indexPath.row])
        }

        return cell
    }
}
