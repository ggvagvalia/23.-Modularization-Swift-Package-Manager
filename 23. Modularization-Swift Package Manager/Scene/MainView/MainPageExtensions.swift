//
//  MainPageExtensions.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import Foundation
import UIKit


extension MainPage: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catsViewModel.numberOfRaws()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catsCell", for: indexPath) as! CustomTableViewCell
        catsViewModel.configureCell(cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}

extension MainPage: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
