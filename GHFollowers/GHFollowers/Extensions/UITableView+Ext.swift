//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by taher elnehr on 03/03/2025.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
         
    }
}
