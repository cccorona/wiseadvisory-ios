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
    let question: String?
    let user_learning: UserLearning
    let special_code: Int?
    let appointment_id: Int?
    let status: String?
    let rating: Int?
    let user: UserMentoring
    let date_parsed: String
    let amount: Double
}

struct UserLearning: Decodable{
    let id: Int
    let email: String
    let telefone: String?
    let birthday: String?
    let fullname: String
    let city: String?
    let state: String?
    let country: String?
    let address: String?
    let picture_file_name: String?
    let reason_change: String?
    let social_provider: String?
    let social_picture: String?
    let device_token: String?
    let auth_token: String?
    let password_reset_token: String?
    let password_reset_sent_at: String?
    let quickblox_id: String?
    let clabe: String?
    let bank: String?
    let is_consulting: Bool?
    let tarifa: String?
    let tag: String?
    let provider: String?
    let uid: String?
    let tarifa2: String?
    let tarifa3: String?
    let online_status: String?
    let activate_qblox: Bool?
    let expertise: String?
    let empresa: String?
    let rfc: String?
    let razon_social: String?
    let direccion: String?
    let codigo_postal: String?
    let ciudad: String?
    let colonia: String?
    let delegacion: String?
    let uso_cfdi: String?
    let tarjeta: String?
    let cover_file_name: String?
    let cover_content_type: String?
    let cover_file_size: Int?
    let cover_updated_at: String?
    let status: String?
    let linkedin_link: String?
    let faceboook_link: String?
    let twitter_link: String?
    let instagram_link: String?
    let tags: String?
    let frecuencia: String?
    let gasto_promedio: String?
    let duracion_promedio: String?
    let ventas: String?
    let fecha_entrevista: String?
    let horario_entrevista: String?
    let auth_key: String?
    let notif_id: String?
    let banwire_token: String?
}

struct UserMentoring: Decodable{
    let id: Int
    let email: String
    let telefone: String?
    let birthday: String?
    let fullname: String
    let city: String?
    let state: String?
    let country: String?
    let address: String?
    let picture_file_name: String?
    let reason_change: String?
    let social_provider: String?
    let social_picture: String?
    let device_token: String?
    let auth_token: String?
    let password_reset_token: String?
    let password_reset_sent_at: String?
    let quickblox_id: String?
    let clabe: String?
    let bank: String?
    let is_consulting: Bool
    let tarifa: String?
    let tag: String?
    let provider: String?
    let uid: String?
    let tarifa2: String?
    let tarifa3: String?
    let online_status: String?
    let activate_qblox: Bool
    let expertise: String?
    let empresa: String?
    let rfc: String?
    let razon_social: String?
    let direccion: String?
    let codigo_postal: String?
    let ciudad: String?
    let colonia: String?
    let delegacion: String?
    let uso_cfdi: String?
    let tarjeta: String?
    let cover_file_name: String?
    let cover_content_type: String?
    let cover_file_size: Int?
    let cover_updated_at: String?
    let status: String
    let linkedin_link: String?
    let faceboook_link: String?
    let twitter_link: String?
    let instagram_link: String?
    let tags: String?
    let frecuencia: String?
    let gasto_promedio: String?
    let duracion_promedio: String?
    let ventas: String?
    let fecha_entrevista: String?
    let horario_entrevista: String?
    let auth_key: String?
    let notif_id: String?
    let banwire_token: String?
}

