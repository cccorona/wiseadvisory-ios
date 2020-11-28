//
//  GlobalValues.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 28/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import Foundation

struct GlobalValues {
    static var shared = GlobalValues()
    var user: LoginResponse?

    private init() { }
}


