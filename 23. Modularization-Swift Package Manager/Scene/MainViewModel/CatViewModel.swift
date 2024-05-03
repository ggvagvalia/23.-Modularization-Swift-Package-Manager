//
//  CatViewModel.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import Foundation
import Service


final class CatViewModel {
    // MARK: - Properties
    public var catModel: CatModel? {
        didSet { catsUpdated?() }
    }
    var catsUpdated: (() -> Void)?
    var service = Service.shared
    let urlString = "https://catfact.ninja/facts?max_length=100&limit=50"
    
    // MARK: - LifeCycle
    func viewDidLoad() {
        fetchCatData()
    }
    
    // MARK: - fetchData
    private func fetchCatData() {
        service.fetchCatData(urlString: urlString) { (currentCat: CatModel?) in
            self.catModel = currentCat
        }
    }
    
    // MARK: - numberOfRawsInSection
    func numberOfRaws() -> Int {
        return self.catModel?.data?.count ?? 0
    }
    
    // MARK: - cellForRawAt
    func configureCell(_ cell: CustomTableViewCell, at index: IndexPath) {
        if let cat = self.catModel?.data?[index.row] {
            cell.configure(with: cat)
        } else {
            cell.catLabel.text = "No data available"
        }
    }
}
