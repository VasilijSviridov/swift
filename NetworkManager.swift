//
//  NetworkManager.swift
//  gbprates4you
//
//  Created by Wasilij on 06/11/2017.
//  Copyright © 2017 Wasilij. All rights reserved.
//

import UIKit

class NetworkManagerRo: NSObject {
    
    
    var defaults:UserDefaults = UserDefaults.standard
    
    override init() {
        super.init()
    }
    
    func getjson(completionHandler:@escaping (Bool)->Void) {
        
            let url = URL(string: "")!
            let task = URLSession.shared.dataTask(with:url) { (datak, response, error) -> Void in
                if let datam = datak {
                    do {
                        // dirty dirty =)
                        let myStructArray = try JSONDecoder().decode(Swifter.self, from: datam)
                        self.defaults.set(myStructArray.eur.one, forKey: "eur1")
                        self.defaults.set(myStructArray.eur.two, forKey: "eur2")
                        self.defaults.set(myStructArray.eur.three, forKey: "eur3")
                        self.defaults.set(myStructArray.eur.four, forKey: "eur4")
                        self.defaults.set(myStructArray.usd.one, forKey: "usd1")
                        self.defaults.set(myStructArray.usd.two, forKey: "usd2")
                        self.defaults.set(myStructArray.usd.three, forKey: "usd3")
                        self.defaults.set(myStructArray.usd.four, forKey: "usd4")
                        
                        completionHandler(true)
                    } catch let error as NSError {
                        completionHandler(false)

                    }
                } else if let error = error {
                    completionHandler(false)
                }
            }
            task.resume()
    }
}
