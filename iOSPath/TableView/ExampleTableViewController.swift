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

struct TableSections: sections {
    func getSections() -> TableSections {
        
    }
    
    
    let titleSection: String
    var dataSource: [String]
}

class ExampleTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var dataSource<T>: [TableSections<T>]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = [TableSections<String>(titleSection: "Delete Rows", dataSource: ["Horse", "Cow", "Camel", "Pig", "Sheep", "Goat"])]
        
    }
}

extension ExampleTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.section].dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].titleSection
    }
}

extension ExampleTableViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ExampleTableViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DeleteRowsViewController")
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            dataSource[indexPath.section].dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        default: break
        }
    }
}



extension ExampleTableViewController: Storyboardable {}
