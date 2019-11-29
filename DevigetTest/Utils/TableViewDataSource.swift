//
//  TableViewDataSource.swift
//  DevigetTest
//
//  Created by Roberto Gutierrez Gonzalez on 11/29/19.
//  Copyright © 2019 Roberto Gutierrez Gonzalez. All rights reserved.
//

import UIKit

class TableViewDataSource<Cell: UITableViewCell, ViewModel> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    typealias TableViewDataSourceCellConfigurationBlock = (Cell, ViewModel, IndexPath) -> ()
    typealias TableViewDataSourceCellSelectorHandler = (ViewModel) -> ()
    
    // MARK: - Internal Properties
    
    private(set) var cellConfigurationBlock: TableViewDataSourceCellConfigurationBlock
    private(set) var cellSelectorHandler: TableViewDataSourceCellSelectorHandler
    
    // MARK: - Private Properties
    
    private let cellIdentifier: String
    private var items: [ViewModel]
    
    // MARK: - Initializers
    
    init(_ cellIdentifier: String,_ items: [ViewModel] , cellConfigurationBlock: @escaping TableViewDataSourceCellConfigurationBlock, cellSelectorHandler: @escaping TableViewDataSourceCellSelectorHandler) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.cellConfigurationBlock = cellConfigurationBlock
        self.cellSelectorHandler = cellSelectorHandler
    }
    
    // MARK: - DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        let item = items[indexPath.row]
        self.cellConfigurationBlock(cell, item, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        self.cellSelectorHandler(item)
    }
    
}
