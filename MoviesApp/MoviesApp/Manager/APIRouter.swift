//
//  APIRouter.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 30/08/2023.
//

import Foundation

///this router have to perform api tasks
struct Router{
    
    ////this function perform api task
    func APIRouter <T:Codable> (requestURL: String, resultType: T.Type, completionHandler: @escaping(_ result: T?, Error?) -> Void){
        
        if let url = URL(string: requestURL){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error{
                    print("The error is: \(error)")
                    return
                }
                if let safeData = data {
                    do {
                        let data = safeData
                        let newJSONDecoder = JSONDecoder()
                        let apiResponse = try newJSONDecoder.decode(T.self, from: data)
                        print("The Decoded Response is: \(apiResponse)")
                        completionHandler(apiResponse, nil)
                    }
                    catch let error {
                        completionHandler(nil,error)
                        print("Unable to parse the JSON The Error is:... \(error.localizedDescription)" )
                    }
                }
            }
            task.resume()
        }
    }
}
