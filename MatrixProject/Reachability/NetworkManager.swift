//
//  NetworkManager.swift
//  MatrixProject
//
//  Created by eyal avisar on 01/08/2021.
//  Copyright © 2021 eyal avisar. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init(){}
    
    var manager = NetworkReachabilityManager(host: "www.apple.com")
    
//    fileprivate var isReachable = false
    
    func startMonitoring() {
        manager?.startListening { (networkStatus) in

            switch networkStatus {
            case .reachable(.cellular):
                print("reachable cellular")
            case .reachable(.ethernetOrWiFi):
                print("reachable wifi/ethernet")
            default:
                print("no network connection")
            }
        }
    }
    
    func isConnected() -> Bool {
        return manager?.isReachable ?? false
    }
}


