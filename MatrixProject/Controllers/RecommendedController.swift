//
//  RecommendedController.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

class RecommendedController: UIViewController {
    
    //MARK:- View Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .green
    }
    
//    let categoriesTable = UITableView()
//    var myDataSource = GenericDataSource()
//
//    //MARK:- View Lifecycle
//    
//    override func loadView() {
//        super.loadView()
//        setupTableView()
//    }
//    
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        checkConnection()
//    }
//    
//    //MARK:- Helper Methods
//    
//    func setupTableView() {
//        view.addSubview(categoriesTable)
//        categoriesTable.translatesAutoresizingMaskIntoConstraints = false
//        categoriesTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        categoriesTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        categoriesTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        categoriesTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        
//        categoriesTable.register(CategoryTableCell.self, forCellReuseIdentifier: "CategoryCell")
//        
//        categoriesTable.dataSource = myDataSource
//        categoriesTable.delegate = myDataSource
//    }
//    
//    @discardableResult func checkConnection() -> Bool {
//        NetworkManager.shared.startMonitoring()
//        
//        if !NetworkManager.shared.isConnected() {
//            offerSetting()
//            return false
//        }
//        
//        return true
//    }
//    
//    func offerSetting() {
//        let alertController = UIAlertController (title: "No Network Connection", message: "Go to Settings?", preferredStyle: .alert)
//        
//        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
//            
//            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
//                return
//            }
//            
//            if UIApplication.shared.canOpenURL(settingsUrl) {
//                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                    print("Settings opened: \(success)") // Prints true
//                })
//            }
//        }
//        alertController.addAction(settingsAction)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//        alertController.addAction(cancelAction)
//        
//        present(alertController, animated: true, completion: nil)
//    }
}
