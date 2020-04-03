//
//  PostsInteractor.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class PostsInteractor : PresenterToInteractorProtocol {
    var APIClient: APIClientProtocol?
    var presenter: InteractorToPresenter?
    
    func getPostsData() {
        // sucess
        // fail
        
        APIClient?.getPosts(completion: { result in
            switch result {
            case .success(let posts):
                self.presenter?.sucess(posts: posts)
            case .failure(let error):
                self.presenter?.fail(errorMessage: error.localizedDescription)
            }
        })
 
    }
    
    
}
