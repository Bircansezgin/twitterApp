//
//  ProfileViewController.swift
//  twitterApp
//
//  Created by Bircan Sezgin on 3/22/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private let profileTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Profile"
        configureTableViewDelegete()
    }
    



}

// MARK: - Setup UI
extension ProfileViewController{
    private func configureTableViewDelegete(){
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
}





// MARK: - Profile TableView
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
