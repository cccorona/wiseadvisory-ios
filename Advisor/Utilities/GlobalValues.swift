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
    var userMentoring: UserMentoring?
    
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
        self.userMentoring?.empresa ?? ""
    }
    var telefone: String {
        self.user?.telefone ?? ""
    }
    var address: String {
        self.user?.address ?? self.userMentoring?.ciudad ?? ""
    }
    var linkedin: String {
        self.user?.linkedin_link ?? self.userMentoring?.linkedin_link ?? ""
    }
    var expertice: String {
        self.userMentoring?.expertise ?? ""
    }
    var areaDomain: String {
        self.userMentoring?.tags ?? ""
    }
    
    //Finance
    var razonSocial: String{
        self.userMentoring?.razon_social ?? ""
    }
    var rfc: String{
        self.userMentoring?.rfc ?? ""
    }
    var cfdi: String{
        self.userMentoring?.uso_cfdi ?? ""
    }
    var bank: String{
        self.userMentoring?.bank ?? ""
    }
    var clabe: String{
        self.userMentoring?.clabe ?? ""
    }
    var colonia: String{
        self.userMentoring?.colonia ?? ""
    }
    var city: String{
        self.userMentoring?.ciudad ?? ""
    }
    var state: String{
        self.userMentoring?.delegacion ?? ""
    }
    var direction: String{
        self.userMentoring?.direccion ?? ""
    }
    var cp: String{
        self.userMentoring?.codigo_postal ?? ""
    }

    private init() { }
}


