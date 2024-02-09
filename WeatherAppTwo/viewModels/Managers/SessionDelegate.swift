//
//  SessionDelegate.swift
//  WeatherAppTwo
//
//  Created by Bhat, Samhitha on 29/01/24.
//

import Foundation

//class SessionDelegate: NSObject, URLSessionDelegate {
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//        guard challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
//              let serverTrust = challenge.protectionSpace.serverTrust else {
//            completionHandler(.performDefaultHandling, nil)
//            return
//        }
// 
//        let credential = URLCredential(trust: serverTrust)
//        completionHandler(.useCredential, credential)
//    }
//}

class SessionDelegate: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        }
    }
}
