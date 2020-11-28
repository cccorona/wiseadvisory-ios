//
//  LoginResponse.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 27/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import Foundation

struct LoginResponse: Decodable{
    let id: Int?
    let email: String?
    let fullname: String?
    let birthday: String?
    let telefone: String?
    let empresa: String?
    let picture: String?
    let address: String?
    let linkedin_link: String?
    let Status: String?
}
