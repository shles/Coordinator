//
//  FeedViewController.swift
//  Coordinator
//
//  Created by Vladimir Shutyuk on 18/05/2020.
//  Copyright © 2020 Vladimir Shutyuk. All rights reserved.
//

import UIKit

final class FeedViewController: UITableViewController {

    var itemRepository: ItemRepository?

    typealias OnItemSelect = ((ItemRepository.Item) -> Void)

    var onItemSelect: OnItemSelect?

    private var items: [ItemRepository.Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        items = itemRepository!.items
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onItemSelect?(items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
