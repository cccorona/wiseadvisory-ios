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
    var user_id: Int {
        self.user?.id ?? 0
    }
    var email: String {
        self.user?.email ?? ""
    }
    var fullname: String {
        self.user?.fullname ?? ""
    }
    var birthday: String {
        self.user?.birthday ?? ""
    }
    var empresa: String {
        self.user?.empresa ?? ""
    }
    var telefone: String {
        self.user?.telefone ?? ""
    }
    var address: String {
        self.user?.address ?? ""
    }
    var linkedin: String {
        self.user?.linkedin_link ?? ""
    }
    var expertice: String {
        self.user?.linkedin_link ?? ""
    }
    var areaDomain: String {
        self.user?.linkedin_link ?? ""
    }

    private init() { }
}


