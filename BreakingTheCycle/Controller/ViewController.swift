//
//  ViewController.swift
//  BreakingTheCycle
//
//  Created by MIRCEA COSMIN-IONUT on 17/03/2018.
//  Copyright © 2018 Cosmin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    //Constants
    let BANKING_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "0245a2b7f7c30ff1d4a0b028c137c19c" //CHANGE THIS WITH THE ID FOR ACCESSING THE DATA
    
    let bankingDataModel = BankingDataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // getCustomerData(url: BANKING_URL, parameters: params)
        
    }
    
    func getCustomerData(url: String, parameters: [String:String]) {
        
        //url where is the request sent
        // .get is about getting the data
        // parameters specificed by opendata weahter map specified for parameters lar and long
        
        let request = Alamofire.request(url, method: .get, parameters: parameters)
        
        //do something with the data coming back
        let _ = request.responseJSON { (response) in
            
            if response.result.isSuccess {
                print("Success!, got the weather data")
                
                //this from SwiftyJSON
                let bankingJSON: JSON = JSON(response.result.value!) //assign the result value converted to json to the JSON weatherJSON constant
                
                self.updateBankingData(json: bankingJSON)
                
            } else {
                //alamofire gives you the eror for the result
                print("Erros \(response.result.error!)")

            }
        }
        
    }
    
    //JSON partins
    
    func updateBankingData(json: JSON) {

        //HOW TO USE IT:
        
//        if let dataTempResult = json["main"]["transactions"] { //.double changes json in double
//
//            bankingDataModel.name = dataTempResult.name
//
//        } else {
//            //POST error
//
//        }
    }

}

