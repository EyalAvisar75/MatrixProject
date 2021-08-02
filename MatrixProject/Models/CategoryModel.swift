//
//  Models.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import Foundation

//class Offer {
//    var name: String
//    var title: String
//    var id: Int
//    var imageURL: String
//    var subtitle: String
//
//    init(name: String, title: String, id: Int, imageURL: String, subtitle: String) {
//        self.name = name
//        self.title = title
//        self.id = id
//        self.imageURL = imageURL
//        self.subtitle = subtitle
//    }
//}
//
//class OffersModel {
//    private var offers: [[Offer]]
//    private var categories: [String] = []
//    var json: [String: Any]? {
//        didSet {
//            if let json = json {
//                populateModels(json: json)
//            }
//        }
//    }
//
//    init() {
//        offers = Array(repeating: [], count: 5)
//    }
//
//    func getAll() -> (categories: [String], offers:[[Offer]]) {
//        return (categories, offers)
//    }
//
//    func getCategory(at index: Int, withId id:Int) -> Offer {
//        return offers[id][index]
//    }
//
//    private func populateModels(json: [String: Any]) {
//        let dataObject = json["DataObject"] as! [[String: Any]]
//        let data = dataObject[0]["DataListObject"] as! [String: Any]
//        let title = data["Title"] as! String
//        let id = data["CatId"] as! Int
//        let imageURL = data["Imag"] as! String
//        let subtitle = data["STitle"] as! String
//
//        let dataList = dataObject[1]["DataListCat"] as! [[String: Any]]
//        let name = ""
//
//        let offer = Offer(name: name, title: title, id: id, imageURL: imageURL, subtitle: subtitle )
//        for attraction in attractions {
//            switch attraction["CatId"] as! Int {
//            case 1:
//                offer.name = dataList[0]["CTitle"] as! String
//                offers[0].append(offer)
//            case 2:
//                offer.name = dataList[1]["CTitle"] as! String
//                offers[1].append(offer)
//            case 3:
//                offer.name = dataList[2]["CTitle"] as! String
//                offers[2].append(offer)
//            case 4:
//                offer.name = dataList[3]["CTitle"] as! String
//                offers[3].append(offer)
//            case 5:
//                offer.name = dataList[4]["CTitle"] as! String
//                offers[4].append(offer)
//            default:
//                break
//            }
//        }
//    }
//
//
//}

var attractions:[[String:Any]] = []
var attractionsByCategories:[[[String:Any]]] = []
var categories:[[String:Any]] = []


func populateModels() {
    var attractionsCategory1:[[String:Any]] = []
    var attractionsCategory2:[[String:Any]] = []
    var attractionsCategory3:[[String:Any]] = []
    var attractionsCategory4:[[String:Any]] = []
    var attractionsCategory5:[[String:Any]] = []
    
    for attraction in attractions {
        switch attraction["CatId"] as! Int {
        case 1:
            attractionsCategory1.append(attraction)
        case 2:
            attractionsCategory2.append(attraction)
        case 3:
            attractionsCategory3.append(attraction)
        case 4:
            attractionsCategory4.append(attraction)
        case 5:
            attractionsCategory5.append(attraction)
        default:
            break
        }
    }
    attractionsByCategories.append(attractionsCategory1)
    attractionsByCategories.append(attractionsCategory2)
    attractionsByCategories.append(attractionsCategory3)
    attractionsByCategories.append(attractionsCategory4)
    attractionsByCategories.append(attractionsCategory5)
}

