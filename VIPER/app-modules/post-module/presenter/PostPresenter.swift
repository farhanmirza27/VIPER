//
//  PostPresenter.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class PostPresenter : ViewToPresenterProtocol {
   
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func getPostsData() {
        interactor?.getPostsData()
    }
    
}

extension PostPresenter : InteractorToPresenter {
    func sucess(posts: [Post]) {
        view?.displayPosts(posts: posts)
    }
    
    func fail(errorMessage: String) {
        view?.error(message: errorMessage)
    }
    
    
}
