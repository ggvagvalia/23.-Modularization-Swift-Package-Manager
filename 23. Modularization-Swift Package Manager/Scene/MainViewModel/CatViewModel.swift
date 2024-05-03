//
//  CatViewModel.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import Foundation
import Service


protocol CatViewModelDelegate: AnyObject {
    func catsFetched(_ cats: CatModel)
}

final class CatViewModel {
    // MARK: - Properties
    public var catModel: CatModel?
    weak  var delegate: CatViewModelDelegate?
    var service = Service.shared
    let urlString = "https://catfact.ninja/facts?max_length=100&limit=50"
    
    // MARK: - LifeCycle
    func viewDidLoad() {
        getCatData()
    }
    
    // MARK: - fetchData
    private func getCatData() {
        service.fetchCatData(urlString: urlString) { [weak self] (currentCat: CatModel?) in
            guard let cat = currentCat else { return }
            DispatchQueue.main.async {
                self?.catModel = cat
                self?.delegate?.catsFetched(cat)
            }
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
