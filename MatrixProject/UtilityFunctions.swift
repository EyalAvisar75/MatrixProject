////
////  UtilityFunctions.swift
////  MatrixProject
////
////  Created by eyal avisar on 01/08/2021.
////  Copyright © 2021 eyal avisar. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//@discardableResult func checkConnection(controller: UIViewController) -> Bool {
//    NetworkManager.shared.startMonitoring()
//
//    if !NetworkManager.shared.isConnected() {
//        offerSetting(controller: controller)
//        return false
//    }
//
//    return true
//}
//
//func offerSetting(controller: UIViewController) {
//    let alertController = UIAlertController (title: "No Network Connection", message: "Go to Settings?", preferredStyle: .alert)
//
//    let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
//
//        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
//            return
//        }
//
//        if UIApplication.shared.canOpenURL(settingsUrl) {
//            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                print("Settings opened: \(success)") // Prints true
//            })
//        }
//    }
//    alertController.addAction(settingsAction)
//    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//    alertController.addAction(cancelAction)
//
//    controller.present(alertController, animated: true, completion: nil)
//}
//
//func getAttractionssData(controller: UIViewController) {
//    //add random event for success/failure due internet connection
//    //think about first time where nothing is cached
//    let session = URLSession(configuration: URLSessionConfiguration.default)
//
//    let sessionDataTask = session.dataTask(with: URL(string: "https://restcountries.eu/rest/v2/all?fields=name;nativeName;area;borders;alpha3Code")!) { data, response, error in
//
//        guard let data = data else {
//            return
//        }
//
//        attractions = json["DataObject"]!["DataListObject"]!
//
//        categories = json["DataObject"]!["DataListCat"]!
//        populateModels()
////        populateTable(controller: controller)
//    }
//
//    sessionDataTask.resume()
//}
//
////func populateTable(controller: UIViewController) {
////    print("in populate table")
////    print(attractions)
////    print(categories)
//////    DispatchQueue.main.sync {
//////        controller.categoriesTable.reloadData()
//////    }
////}
//
