//
//  ViewController.swift
//  iOSPath
//
//  Created by johann on 15/12/2018.
//  Copyright © 2018 johann. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var dataSource = DataSource.data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = dataSource[indexPath.row]
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.subtitle
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource[indexPath.row]
        let storyboard = UIStoryboard(name: model.storyboardName, bundle: nil)
        if let vc = storyboard.instantiateInitialViewController() {
            show(vc, sender: self)
        }
        
    }
}

