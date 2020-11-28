//
//  RCManager.swift
//  CollegeOne
//
//  Created by Cesar Corona on 5/9/20.
//  Copyright © 2020 CollegeOne. All rights reserved.
//

import Foundation


class RCManager {
    
    static let sharedInstance = RCManager()
    
    private init() {
        loadDefatultValues()
    }
    
    
    func loadDefatultValues(){
        
        let appDefaults : [String : Any?] = [
        "actions" : {
        
         }
        ]
    }
    
}
