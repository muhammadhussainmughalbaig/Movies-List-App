//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 30/08/2023.
//

import Foundation

class MoviesRepository {
    
    private var moviesRemoteDS: MoviesRemoteDS = MoviesRemoteDS(router: Router())
    //        private var authLDS: AuthLocalDS()
    
    func getRemoteDataRequest(completionHandler: @escaping(_ result: [Result]?, Error?) -> Void){
        moviesRemoteDS.callAPIRouter { result, error in
            if result != nil{
                completionHandler(result,nil)
            } else{
                completionHandler(nil,error)
            }
        }
    }

}
