//
//  NetworkAlamofire.swift
//  Practice
//
//  Created by Burhan Tarık Doğdu on 6.03.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
   

func executeLogin() -> String{
    
    var Data = ""
        
    AF.request("https://jsonplaceholder.typicode.com/posts/1").responseJSON{response in
        switch response.result{
        
        case .failure(let error):
            print("Got an error in Request.")
            print(error)
        
        case .success(let data):
            print("Successfully got requested data.")
            Data = "\(data)"
            print(data)
            print("Converted Data is:")
            print(Data)
        }
        
        
    }
    return Data
    
}


//https://jsonplaceholder.typicode.com/posts
