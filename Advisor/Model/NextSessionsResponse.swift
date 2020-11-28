//
//  NextSessionsResponse.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 28/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import Foundation

struct NextSessionsResponse: Decodable{
    let id: Int
    let duration_seconds: Int?
    let user_id: Int
    let user_learning_id: Int
    let question: String
    let user_learning: UserLearning
    let special_code: Int?
    let appointment_id: Int?
    let status: String?
    let rating: Int
    let user: UserMentoring
    let date_parsed: String
    let amount: Double
}

struct UserLearning: Decodable{

}

struct UserMentoring: Decodable{

}

