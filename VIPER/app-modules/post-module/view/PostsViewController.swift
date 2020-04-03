//
//  PostsViewController.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "PostCellId"

class PostsViewController: UITableViewController {

    var presenter : ViewToPresenterProtocol?
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        presenter?.getPostsData()
    }


    private func setupLayout() {
        navigationItem.title = "Posts"
        tableView.tableFooterView = UIView()
        tableView.register(PostCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PostCell
        cell.post = posts[indexPath.row]
        return cell
    }
    
}


extension PostsViewController : PresenterToViewProtocol {
    func displayPosts(posts: [Post]) {
        self.posts = posts
       
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func error(message: String) {
         // present error
         print(message)
    }
    
    
}
