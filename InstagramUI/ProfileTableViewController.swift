//
//  ProfileTableViewController.swift
//  InstagramUI
//
//  Created by Ivor D. Addo on 4/6/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ProfileTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    @IBAction func logOutBtnPressed(_ sender: Any) {
        func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            self.present(vc!, animated:true, completion:nil)
            
        }
        
    }
    
}
