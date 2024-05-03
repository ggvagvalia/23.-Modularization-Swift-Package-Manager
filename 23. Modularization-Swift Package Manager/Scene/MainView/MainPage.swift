//
//  MainPage.swift
//  23. Modularization-Swift Package Manager
//
//  Created by gvantsa gvagvalia on 5/2/24.
//

import UIKit
import Service

class MainPage: UIViewController {
    
    // MARK: - Properties
    var catsViewModel: CatViewModel
    let catsTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "catsCell")
        view.separatorStyle = .none
        return view
    }()
    
    init() {
        self.catsViewModel = CatViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        catsViewModel.delegate = self
        catsViewModel.viewDidLoad()
        //        catsTableView.reloadData()
    }
    
    // MARK: - SetupUI
    func setupUI() {
        view.addSubview(catsTableView)
        //        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Facts About Cats"
        
        catsTableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        catsTableView.dataSource = self
        catsTableView.delegate = self
        
        NSLayoutConstraint.activate([
            catsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 21),
            catsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            catsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -27),
            catsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
}

