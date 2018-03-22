//
//  FeedViewController.swift
//  ReSwiftFeedSample
//
//  Created by Yuki Hirai on 2018/03/22.
//  Copyright © 2018年 Recruit Marketing Partners Co., Ltd. All rights reserved.
//

import UIKit
import ReSwift

final class FeedViewController: UITableViewController {
    var store: AppStore!

    private var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        store = AppStore(
            reducer: appReducer,
            state: nil
        )

        store.dispatch(ShowFeed.load())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) { $0.select { $0.showFeed } }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
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

// MARK: - StoreSubscriber

extension FeedViewController: StoreSubscriber {
    func newState(state: ShowFeed.State) {
        posts = state.posts
        tableView.reloadData()
    }
}
