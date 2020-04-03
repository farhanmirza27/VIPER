//
//  PostsRouter.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class PostsRouter : PresenterToRouterProtocol {
    static func createModule() -> PostsViewController {
        
        let view = PostsViewController()
        let presenter : ViewToPresenterProtocol & InteractorToPresenter = PostPresenter()
        let interactor : PresenterToInteractorProtocol = PostsInteractor()
        let router : PresenterToRouterProtocol = PostsRouter()
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.APIClient = APIClient()
        
        return view
    }
    
    
}
