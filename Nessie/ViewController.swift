//
//  ViewController.swift
//  Nessie
//
//  Created by Erik Koebke on 1/29/16.
//  Copyright © 2016 Erik Koebke. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@IBDesignable class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func findAllAtms(sender: AnyObject) {
        getAllAtms()
    }
    
    
    @IBAction func myCustomerInfo(sender: AnyObject) {
        getMyCustomerInfo()
    }
    
    @IBAction func myAccountInfo(sender: AnyObject) {
        getMyAccountInfo()
    }
    
    @IBAction func myBillHistory(sender: AnyObject) {
        getMyBillHistory()
    }
    
    @IBAction func myPurchases(sender: AnyObject) {
        getMyPurchases()
    }
    
    @IBAction func makeADeposit(sender: AnyObject) {
        
    }
    
    
    
    
    
    
    
    
    
    
    // get all atms
    func getAllAtms() {
        let atmsEndpoint = "http://api.reimaginebanking.com/atms"
        Alamofire.request(.GET, atmsEndpoint, parameters: ["lat":38.9283, "lng":-77.1753, "rad":1, "key":Constants.nessieApiKey]).responseJSON {
            response -> Void in
            
            switch response.result {
            case .Success(let data):
                print(data)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func getMyCustomerInfo() {
        let customersEndpoint = "http://api.reimaginebanking.com/customers/\(Constants.myCustomerId)"
        Alamofire.request(.GET, customersEndpoint, parameters: ["key":Constants.nessieApiKey]).responseJSON {
            response -> Void in
            
            switch response.result {
            case .Success(let data):
                let json = JSON(data)
                print(json)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func getMyAccountInfo() {
        let endpoint = "http://api.reimaginebanking.com/customers/\(Constants.myCustomerId)/accounts"
        Alamofire.request(.GET, endpoint, parameters: ["key":Constants.nessieApiKey]).responseJSON {
            response -> Void in
            
            switch response.result {
            case .Success(let data):
                let json = JSON(data)
                print(json)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func getMyBillHistory() {
        let endpoint = "http://api.reimaginebanking.com/customers/\(Constants.myCustomerId)/bills"
        Alamofire.request(.GET, endpoint, parameters: ["key":Constants.nessieApiKey]).responseJSON {
            response -> Void in
            
            switch response.result {
            case .Success(let data):
                let json = JSON(data)
                print(json)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func getMyPurchases() {
        let endpoint = "http://api.reimaginebanking.com/accounts/\(Constants.myAccountId)/purchases"
        Alamofire.request(.GET, endpoint, parameters: ["key":Constants.nessieApiKey]).responseJSON {
            response -> Void in
            
            switch response.result {
            case .Success(let data):
                let json = JSON(data)
                print(json)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func submitDeposit() {
        let endpoint = "http://api.reimaginebanking.com/accounts/\(Constants.myAccountId)/deposits?key=\(Constants.nessieApiKey)"
        let parameters: [String: AnyObject] = [
            "medium": "balance",
            "transaction_date": "2016-01-29",
            "status": "completed",
            "amount": 300,
            "description": "For stuff."
        ]
        Alamofire.request(.POST, endpoint, encoding: .JSON, parameters: parameters).responseJSON {
            response -> Void in
            
            switch response.result {
            case .Success(let data):
                let json = JSON(data)
                print(json)
            case .Failure(let error):
                print(error)
            }
        }
        
    }
}

