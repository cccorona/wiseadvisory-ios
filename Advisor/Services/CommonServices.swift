//
//  CommonServices.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 16/10/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import Foundation

struct URLS{
    static let baseURL = "https://www.wiseadvisory.net/"
    static let loginURL = URLS.baseURL + "loginUser"
    static let updateUserURL = URLS.baseURL + "updateUserInfo"
    static let updateBilling = URLS.baseURL + "updateFacturacion"
    static let registerExperience = URLS.baseURL + "registerExperience"
    static let registerEducation = URLS.baseURL + "registerEducation"
    static let registerLanguage = URLS.baseURL + "registerLanguage"
    static let deleteLanguage = URLS.baseURL + "deleteLanguage"
    static let deleteExperience = URLS.baseURL + "deleteExperience"
    static let deleteEducation = URLS.baseURL + "deleteEducation"
    static let updatePaymentMethod = URLS.baseURL + "update_pago_metodo"
    static let getTokenCard = "https://cr.banwire.com?action=card&exist=1"
    
    static let getNextSessions = URLS.baseURL + "getNextSessions"
    static let getlastSessions = URLS.baseURL + "getlastSessions"
    static let logoutUser = URLS.baseURL + "logoutUser"
}
