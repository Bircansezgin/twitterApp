//
//  ProfileViewController.swift
//  twitterApp
//
//  Created by Bircan Sezgin on 3/22/24.
//

import UIKit
import SnapKit

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
        view.addSubview(profileTableView)
        configureTableViewDelegete()
        configureConstrait()
        setupHeaderView()
    }
    



}

// MARK: - Setup UI
extension ProfileViewController{
    private func configureTableViewDelegete(){
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        //
    }
    
    
    private func setupHeaderView(){
        let headerView = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 380))
        
        profileTableView.tableHeaderView = headerView

    }
    
    
    // Constraits
    private func configureConstrait(){
        profileTableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        
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





