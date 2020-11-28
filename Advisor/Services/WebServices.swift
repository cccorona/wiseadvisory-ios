//
//  LoginServices.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 27/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

enum Result<T> {
    case success(T)
    case failure(Error)
}

class WebServices: NSObject {
    
    private static var sharedNetworkManager: WebServices = {
        let networkManager = WebServices(baseURL: URL(string: URLS.baseURL)!)
        return networkManager
    }()
    
    let baseURL: URL
    var progressAlert : LoadingViewController!
    var isShowingProgress = false
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    class func shared() -> WebServices {
        return sharedNetworkManager
    }
    
    func loginUser(_ email:String , pass:String , completion : @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "email" : email,
            "password" : pass
        ]
        AF.request(URLS.loginURL, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updateUser(id: Int, email:String, fullname: String? = nil, empresa:String? = nil, telefone:String? = nil, picture:String? = nil, cover:String? = nil, expertise:String? = nil, tags:String? = nil, twitter_link:String? = nil, facebook_link:String? = nil, linkedin_link:String? = nil, instagram_link:String? = nil, address:String? = nil, city:String? = nil, cp:String? = nil, birthday:String? = nil, completion : @escaping ((Result<LoginResponse>) -> ())){
        var parameters : Parameters = [
            "user_id":id,
            "email":email
        ]
        if let fullname = fullname{
            parameters["fullname"] = fullname
        }
        if let empresa = empresa{
            parameters["empresa"] = empresa
        }
        if let telefone = telefone{
            parameters["telefone"] = telefone
        }
        if let picture = picture{
            parameters["picture"] = picture
        }
        if let cover = cover{
            parameters["cover"] = cover
        }
        if let expertise = expertise{
            parameters["expertise"] = expertise
        }
        if let tags = tags{
            parameters["tags"] = tags
        }
        if let twitter_link = twitter_link{
            parameters["twitter_link"] = twitter_link
        }
        if let facebook_link = facebook_link{
            parameters["facebook_link"] = facebook_link
        }
        if let linkedin_link = linkedin_link{
            parameters["linkedin_link"] = linkedin_link
        }
        if let instagram_link = instagram_link{
            parameters["instagram_link"] = instagram_link
        }
        if let address = address{
            parameters["address"] = address
        }
        if let city = city{
            parameters["city"] = city
        }
        if let cp = cp{
            parameters["cp"] = cp
        }
        if let birthday = birthday{
            parameters["birthday"] = birthday
        }
        AF.request(URLS.updateUserURL, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updateBilling(user_id:Int, razon_social:String, rfc:String, direccion:String, codigo_postal:String, ciudad:String, delegacion:String, colonia:String, uso_cfdi:String, tarjeta:String, bank:String, clabe:String,  completion : @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "user_id": user_id,
            "razon_social":razon_social,
            "rfc":rfc,
            "direccion":direccion,
            "codigo_postal":codigo_postal,
            "ciudad": ciudad,
            "delegacion": delegacion,
            "colonia":colonia,
            "uso_cfdi":uso_cfdi,
            "tarjeta":tarjeta,
            "bank":bank,
            "clabe":clabe
        ]
        AF.request(URLS.updateBilling, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func registerExperience(user_id:Int, company_worked:String, years:String, position:String, responsabilities:String, city:String, country:String, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "user_id":user_id,
            "company_worked":company_worked,
            "years":years,
            "position":position,
            "responsabilities":responsabilities,
            "city":city,
            "country": country
        ]
        AF.request(URLS.registerExperience, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func registerEducation(user_id:Int, school_name:String, years_studied:String, title_obtained:String, career_name:String, city:String, country:String, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "user_id":user_id,
            "school_name":school_name,
            "years_studied":years_studied,
            "title_obtained":title_obtained,
            "career_name":career_name,
            "city":city,
            "country": country
        ]
        AF.request(URLS.registerEducation, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func registerLanguage(user_id:Int, name:String, experience:String, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "user_id":user_id,
            "name":name,
            "experience":experience
        ]
        AF.request(URLS.registerLanguage, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteLanguage(language_id:Int, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "language_id":language_id
        ]
        AF.request(URLS.deleteLanguage, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteExperience(experience_id:Int, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "experience_id":experience_id
        ]
        AF.request(URLS.deleteExperience, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteEducation(education_id:Int, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "education_id":education_id
        ]
        AF.request(URLS.deleteEducation, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updatePaymentMethod(user_id:Int, banwire_token:String, completion: @escaping ((Result<LoginResponse>) -> ())){
        let parameters : Parameters = [
            "user_id":user_id,
            "banwire_token":banwire_token
        ]
        AF.request(URLS.updatePaymentMethod, method: .post, parameters: parameters).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func getNextSessions(user_id:Int, completion: @escaping ((Result<[NextSessionsResponse]>) -> ())){
        let url = URLS.getNextSessions+"?user_id=\(user_id)"
        AF.request(url, method: .get).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode([NextSessionsResponse].self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getlastSessions(user_id:Int, completion: @escaping ((Result<LoginResponse>) -> ())){
        let url = URLS.getlastSessions+"?user_id=\(user_id)"
        AF.request(url, method: .get).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func logoutUser(user_id:Int, completion: @escaping ((Result<StatusResponse>) -> ())){
        let url = URLS.logoutUser+"?user_id=\(user_id)"
        AF.request(url, method: .get).responseJSON { response in
                debugPrint(response)
            switch response.result{
            case .success( _):
                do{
                    let loginResult = try JSONDecoder().decode(StatusResponse.self, from: response.data!)
                    completion(.success(loginResult))
                }catch {
                    completion(
                        .failure(NSError(domain: "", code: 001, userInfo: [NSLocalizedDescriptionKey: "Respuesta no aceptada"]))
                    )
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension WebServices{
    func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func showInternetError(){
        MessageObject.sharedInstance.showMessage("Verifique su conexion a internet", title: "Error", accept: "Aceptar")
    }
    
    func showGpsErrorr(){
        MessageObject.sharedInstance.showMessage("Encienda du GPS", title: "Error", accept: "Aceptar")
    }
    
    func showGenericalError(error:String){
        MessageObject.sharedInstance.showMessage(error, title: "Error", accept: "Aceptar")
    }
    
    func showGenericalMensaje(error:String){
        MessageObject.sharedInstance.showMessage(error, title: "College One", accept: "Aceptar")
    }
    
    func showTryAgainError(error:String){
        MessageObject.sharedInstance.showMessage(error, title: "Alert", accept: "Try Again")
    }
    
    func showLoading(){
        if !self.isShowingProgress {
            progressAlert = LoadingViewController()
            progressAlert.modalPresentationStyle = .overCurrentContext
            progressAlert.modalTransitionStyle = .crossDissolve
            progressAlert.view.alpha = 0.0
            if #available(iOS 13.0, *) {
                if var topController = UIApplication.shared.keyWindow?.rootViewController  {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    topController.present(progressAlert, animated: false, completion:{
                        UIView.animate(withDuration: 0.7, animations: {
                            self.progressAlert.view.alpha = 1.0
                            self.isShowingProgress = true
                        })
                    })
                }
            } else {
                let window = UIWindow.init(frame: UIScreen.main.bounds)
                window.rootViewController = UIViewController.init()
                window.windowLevel = UIWindow.Level.alert + 1
                window.makeKeyAndVisible()
                window.rootViewController?.present(progressAlert, animated: false, completion:{
                    UIView.animate(withDuration: 0.7, animations: {
                        self.progressAlert.view.alpha = 1.0
                        self.isShowingProgress = true
                    })
                })
            }
        }
    }
    
    func hideLoading(closure: (() -> Void)? = nil){
        progressAlert.dismiss(animated: false) {
            closure?()
            UIView.animate(withDuration: 0.7, animations: {
                self.progressAlert.view.alpha = 0.1
            })
            self.isShowingProgress = false
            print("Finish loading")
        }
    }
}
