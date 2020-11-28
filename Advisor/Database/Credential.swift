//
//  Credential.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 28/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import Foundation


class Credential {
    
    static let shared = Credential()
    
    func saveLastAccount(account:String ,credential:String){
        let userDetafults = UserDefaults.standard
        userDetafults.set(account, forKey: "lastaccount")
        userDetafults.set(credential, forKey: "lastcredential")
        userDetafults.synchronize()
    }
    
    func getLastAccount() -> String {
        var account = ""
        let userDetafults = UserDefaults.standard
        account = userDetafults.string(forKey: "lastaccount") ?? ""
        return account

    }
    
    func getLastCredential() -> String {
        var credential = ""
        let userDetafults = UserDefaults.standard
        credential = userDetafults.string(forKey: "lastcredential") ?? ""
        return credential
        
    }
    
    func logOut(){
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "lastaccount")
        userDefaults.removeObject(forKey: "lastcredential")
        userDefaults.synchronize()
    }
}
