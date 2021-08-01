////
////  Generic.swift
////  MatrixProject
////
////  Created by eyal avisar on 01/08/2021.
////  Copyright © 2021 eyal avisar. All rights reserved.
////
//
//import UIKit
//
//class GenericDataSource: NSObject {
//
//let identifier = "CellId"
//var array: [Any] = []
//
//func registerCells(forTableView tableView: UITableView) {
//    tableView.register(UINib(nibName: "", bundle: nil), forCellReuseIdentifier: identifier)
//}
//
//func loadCell(atIndexPath indexPath: IndexPath, forTableView tableView: UITableView) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//    return cell
//  }
//}
//
//// UITableViewDataSource
//extension GenericDataSource: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("categories",categories.count)
//        return categories.count
//      }
//        
//      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableCell
//                
//
//        cell.categoryName.text = categories[indexPath.row]["CTitle"] as! String
//        cell.categoryId =
//        categories[indexPath.row]["CatId"] as! Int
//    
//        cell.attractionDelegate = self
//        return cell
//      }
//
//}
//// UITableViewDelegate
//extension GenericDataSource: UITableViewDelegate {
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            tableView.reloadData()
//        }
//        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 300
//        }
//}
//
//extension GenericDataSource: CategoryTableCellDelegate {
//    func didSelectItem(categoryItem:(category:Int, row:Int))
//    {
//        print(categoryItem.0, categoryItem.1)
//    }
//}
//
//protocol GenericDataSourceDelegate: class {
//            // Delegate callbacks methods
//}
