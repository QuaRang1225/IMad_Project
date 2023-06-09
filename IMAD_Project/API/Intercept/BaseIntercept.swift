//
//  BaseIntercept.swift
//  IMAD_Project
//
//  Created by 유영웅 on 2023/05/06.
//

import Foundation
import Alamofire

class BaseIntercept:RequestInterceptor{
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let token = UserDefaultManager.shared.getToken()
        var urlReq = urlRequest
        
        urlReq.headers.add(.authorization(bearerToken: token.accessToken))
        completion(.success(urlReq))
    }
}

class GetTokenIntercept:RequestInterceptor{
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let token = UserDefaultManager.shared.getToken()
        var urlReq = urlRequest
        
        urlReq.headers.add(.authorization(bearerToken: token.accessToken))
        urlReq.addValue("\(token.refreshToken)", forHTTPHeaderField: "Authorization-refresh")
        completion(.success(urlReq))
    }
}
