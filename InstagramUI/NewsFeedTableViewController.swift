//
//  NewsFeedTableViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo on 4/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {

    var posts: [Post]?
    
    struct Storyboard  {
        static let postCell = "PostCell"
        static let postHeaderCell = "PostHeaderCell"
        static let postHeaderHeight: CGFloat = 57.0
        static let postCellDefaultHeight: CGFloat = 578.0
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchPosts()
        tableView.estimatedRowHeight = Storyboard.postCellDefaultHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = UIColor.clear
        
        
    }
    
    func fetchPosts() {
        self.posts = Post.fetchPosts()
        self.tableView.reloadData()
        
    }
}

//MARK -- NewsFeed Extension

extension NewsFeedTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = posts {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postCell, for: indexPath) as! PostCell
        cell.post = self.posts?[indexPath.section]
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postHeaderCell) as! PostHeaderCell
        cell.post = self.posts?[section]
        cell.backgroundColor = UIColor.white
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Storyboard.postHeaderHeight
    }
    
    
    
}










