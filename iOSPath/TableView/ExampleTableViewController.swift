//
//  ExampleTableViewController.swift
//  iOSPath
//
//  Created by johann on 15/12/2018.
//  Copyright © 2018 johann. All rights reserved.
//

import UIKit

protocol sections {
    func getSections() -> TableSections
}

struct TableSections  {
    let titleSection: [String]
    let storyBoardName: [String]
}

class ExampleTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var dataSource: TableSections?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = TableSections(titleSection: ["Delete/Insert rows"], storyBoardName: ["DeleteRowsViewController"])
        
    }
}

extension ExampleTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.titleSection.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataSource?.titleSection[indexPath.row] ?? ""
        
        return cell
    }
    
}

extension ExampleTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSource = self.dataSource else { return }
        let storyboard = UIStoryboard(name: "ExampleTableViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: dataSource.storyBoardName[indexPath.row])
        vc.title = dataSource.titleSection[indexPath.row]
        show(vc, sender: self)
    }
}



extension ExampleTableViewController: Storyboardable {}
