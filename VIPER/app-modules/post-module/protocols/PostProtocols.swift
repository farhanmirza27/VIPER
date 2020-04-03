//
//  PostProtocols.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//



// post module business logic

protocol ViewToPresenterProtocol : class {
    
    var view : PresenterToViewProtocol? {get set}
    var interactor : PresenterToInteractorProtocol? {get set}
    var router : PresenterToRouterProtocol? {get set}
    
    func getPostsData()
    
}

protocol PresenterToViewProtocol : class {
    func displayPosts(posts : [Post])
    func error(message : String)
}

protocol PresenterToInteractorProtocol : class {
    var APIClient : APIClientProtocol? {get set}
    var presenter : InteractorToPresenter? {get set}
    func getPostsData()
}

protocol InteractorToPresenter : class {
    func sucess(posts : [Post])
    func fail(errorMessage : String)
}


protocol PresenterToRouterProtocol : class {
    static func createModule() -> PostsViewController
}
