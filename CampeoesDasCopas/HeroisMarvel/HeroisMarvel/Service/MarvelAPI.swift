//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Jonathan Gomes on 13/03/2019.
//  Copyright © 2019 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelApi {
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "4391475a1cf1550d977ceb2728dcaba525422f60"
    static private let publicKey = "bb83fc446e68b7ef5097a9c8daf27079"
    static private let limit = 50
    
    class func loadHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let url = prepareURL(name, offset)
        print(url)
        
        AF.request(url).responseJSON { (response) in
            guard let data = response.data else{
                onComplete(nil)
                return
            }
            do{
                let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                if(marvelInfo.code == 200){
                    onComplete(marvelInfo)
                }else{
                    onComplete(nil)
                    return
                }
            }catch{
                print("jSON error")
                print(error)
                onComplete(nil)
            }
        }
        
    }
    
    fileprivate static func prepareURL(_ name: String?, _ offset: Int) -> String{
        let startsWith : String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        return "\(basePath)offset=\(offset)&limit=\(limit)&\(startsWith)\(getCredentials())"
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
