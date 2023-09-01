//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 30/08/2023.
//

import Foundation

class MoviesViewModel {
    
    var responseData: [Result]?
    var repository: MoviesRepository = MoviesRepository()
    let delegate: MoviesViewDelegate
    
    init(delegate: MoviesViewDelegate) {
        self.delegate = delegate
    }
    
    func fetchData(){
        repository.getRemoteDataRequest { result, error in
            if let result = result {
                self.responseData = result
                self.delegate.successfullyFetchData()
            }else{
                print("\(String(describing: error))")
                self.delegate.failToFetchData(error: error!.localizedDescription)
            }
        }
    }
    
    func getData() -> [Result?] {
        return self.responseData ?? []
    }
    
    func getDataAtIndex(index: Int) -> Result? {
        return self.responseData?[index]
    }
}
