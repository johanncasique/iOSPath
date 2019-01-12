//
//  DataSource.swift
//  iOSPath
//
//  Created by johann on 15/12/2018.
//  Copyright © 2018 johann. All rights reserved.
//

import Foundation

class DataSource {
    
    struct ExampleType {
        var title: String
        var subtitle: String
        var storyboardName: String
    }
    
    static var data: [ExampleType] {
        return [ExampleType(title: "Table View", subtitle: "TableView/ExampleTableViewController", storyboardName: "ExampleTableViewController")]
    }
}
