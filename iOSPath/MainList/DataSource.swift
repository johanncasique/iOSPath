//
//  DataSource.swift
//  iOSPath
//
//  Created by johann on 15/12/2018.
//  Copyright © 2018 johann. All rights reserved.
//

import UIKit

class DataSource {
    
    struct ExampleSection {
        var sectionTitle: String
        var items: [ExampleType]
    }
    
    struct ExampleType {
        var title: String
        var subtitle: String
        var storyboardName: UIViewController
    }
    
    static var data: [ExampleSection] {
        return [tableViewSection]
    }
    
    private static var tableViewSection: ExampleSection  {
        let storyboard = UIStoryboard(name: "DeleteRowsViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc?.title = "DeleteInsertRowsViewController"
        
        
        let items = [ExampleType(title: "Delete Rows",
                                 subtitle: "DeleteInsertRowsViewController",
                                 storyboardName: vc!),
                     ExampleType(title: "DragAndDrop",
                                 subtitle: "DragAndDropViewController",
                                 storyboardName: DragAndDropViewController())]
        
        let section = ExampleSection(sectionTitle: "UITableView", items: items)
        return section
    }
    
    
}
