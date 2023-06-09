//
//  UserApiService.swift
//  IMAD_Project
//
//  Created by 유영웅 on 2023/05/16.
//

import Foundation
import Alamofire
import Combine

enum UserApiService{
    
    
    static var intercept = BaseIntercept()
    
    static func user() -> AnyPublisher<GetUserInfo,AFError>{
        print("유저정보 api 호출")
        return ApiClient.shared.session
            .request(UserRouter.user,interceptor: intercept)
            .publishDecodable(type: GetUserInfo.self)
            .value()
            .map{ receivedValue in
                print("결과 메세지  : \(receivedValue.message ?? "")")
                return receivedValue.self
            }
            .eraseToAnyPublisher()
    }
    static func patchUser(gender:String?,ageRange:Int?,image:Int,nickname:String,genre:String?) -> AnyPublisher<GetUserInfo,AFError>{
        print("유저정보변경 api 호출")
        return ApiClient.shared.session
            .request(UserRouter.patchUser(gender: gender, ageRange: ageRange, image: image, nickname: nickname, genre: genre),interceptor: intercept)
            .publishDecodable(type: GetUserInfo.self)
            .value()
            .map{ receivedValue in
                print("결과 메세지  : \(receivedValue.message ?? "")")
                return receivedValue.self
            }
            .eraseToAnyPublisher()
    }
    static func passwordChange(old:String,new:String)-> AnyPublisher<PasswordChange,AFError>{
        print("비밀번호변경 api 호출")
        return ApiClient.shared.session
            .request(UserRouter.passwordChange(old: old, new: new),interceptor: intercept)
            .publishDecodable(type: PasswordChange.self)
            .value()
            .map{ receivedValue in
                print("결과 메세지  : \(receivedValue.message ?? "")")
                return receivedValue.self
            }
            .eraseToAnyPublisher()
    }


}
