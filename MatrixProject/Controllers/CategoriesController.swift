//
//  ViewController.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import UIKit

class CategoriesController: UIViewController {
    
    //MARK:- Properties
    let categoriesTable = UITableView()
//    var myDataSource = GenericDataSource()

    //MARK:- View Lifecycle
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        checkConnection()
        getAttractionssData()
//        checkConnection(controller: self)
//        getAttractionssData(controller: self)
    }
    
    //MARK:- Helper Methods
    
    func setupTableView() {
        view.addSubview(categoriesTable)
        categoriesTable.translatesAutoresizingMaskIntoConstraints = false
        categoriesTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        categoriesTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        categoriesTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        categoriesTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        categoriesTable.register(CategoryTableCell.self, forCellReuseIdentifier: "CategoryCell")
        
        categoriesTable.dataSource = self
        categoriesTable.delegate = self
    }
    
    @discardableResult func checkConnection() -> Bool {
        NetworkManager.shared.startMonitoring()

        if !NetworkManager.shared.isConnected() {
            offerSetting()
            return false
        }

        return true
    }
    
    func offerSetting() {
        let alertController = UIAlertController (title: "No Network Connection", message: "Go to Settings?", preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in

            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }

            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
    
    func getAttractionssData() {
        //add random event for success/failure due internet connection
        //think about first time where nothing is cached
        let session = URLSession(configuration: URLSessionConfiguration.default)

        let sessionDataTask = session.dataTask(with: URL(string: "https://restcountries.eu/rest/v2/all?fields=name;nativeName;area;borders;alpha3Code")!) { data, response, error in

            guard let data = data else {
                return
            }

            attractions = json["DataObject"]!["DataListObject"]!

            categories = json["DataObject"]!["DataListCat"]!
            populateModels()
            self.populateTable()
        }

        sessionDataTask.resume()
    }

    func populateTable() {
        DispatchQueue.main.sync {
               self.categoriesTable.reloadData()
        }
    }

}

extension CategoriesController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableCell


    cell.categoryName.text = categories[indexPath.row]["CTitle"] as! String
    cell.categoryId =
    categories[indexPath.row]["CatId"] as! Int
//    cell.viewTitle = title!
//    print("setting id title",cell.categoryId, cell.viewTitle)
    cell.attractionDelegate = self
    return cell
  }
}

extension CategoriesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 3
    }
}

extension CategoriesController: CategoryTableCellDelegate {
    func didSelectItem(categoryItem:(category:Int, row:Int))
    {
        print("did select")
        let categoryView = CategoryController()
        categoryView.view.backgroundColor = .white
        categoryView.item = categoryItem
        present(categoryView, animated: true, completion: nil)
    }
}




