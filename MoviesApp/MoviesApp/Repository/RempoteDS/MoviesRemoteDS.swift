//
//  MoviesRemoteDS.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 30/08/2023.
//

import Foundation

class MoviesRemoteDS {
    
/// URL to be hit
    var urlString: String = "https://api.themoviedb.org/3/movie/popular?api_key=5f68cac3565131e189f5be6c24e7370c"
    
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func callAPIRouter(completionHandler: @escaping(_ result: [Result]?, Error?) -> Void) {
        
        router.APIRouter(requestURL: urlString, resultType: Welcome.self) { response, error in
            if let response = response{
                completionHandler(response.results,nil)
            }else{
                completionHandler(nil,error)
            }
        }
    }
    
}
