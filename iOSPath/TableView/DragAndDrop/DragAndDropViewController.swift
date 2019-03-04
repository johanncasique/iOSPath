//
//  DragAndDropViewController.swift
//  iOSPath
//
//  Created by johann on 04/03/2019.
//  Copyright © 2019 johann. All rights reserved.
//

import UIKit

class DragAndDropViewController: UIViewController {
    var leftTableView = UITableView()
    var rightTableView = UITableView()
    
    var leftItems = [String](repeating: "Left", count: 20)
    var rightItems = [String](repeating: "Right", count: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftTableView.dataSource = self
        rightTableView.dataSource = self
        
        leftTableView.frame = CGRect(x: 0, y: 40, width: 150, height: 400)
        rightTableView.frame = CGRect(x: 150, y: 40, width: 150, height: 400)
        
        leftTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        rightTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.addSubview(leftTableView)
        view.addSubview(rightTableView)
    }
}

extension DragAndDropViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return leftItems.count
        } else {
            return rightItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if tableView == leftTableView {
            cell.textLabel?.text = leftItems[indexPath.row]
        } else {
            cell.textLabel?.text = rightItems[indexPath.row]
        }
        
        return cell
    }
}


