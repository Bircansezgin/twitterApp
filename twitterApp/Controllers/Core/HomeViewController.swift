//
//  HomeViewController.swift
//  twitterApp
//
//  Created by Bircan Sezgin on 3/22/24.
//

import UIKit

#Preview{
    MainTabbarController()
}


class HomeViewController: UIViewController {
    
    private func configureNavigationBar() {
        
        // Twitter Logo
        let size : CGFloat = 46
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "twitterlogo")
        
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        middleView.addSubview(logoImageView)
        navigationItem.titleView = middleView
        
        
        // ProfileImage
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfileImage))
    }
    
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAddSubView()
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timelineTableView.frame = view.frame
    }
    

  
}


// MARK: - Setup UI
extension HomeViewController{
    private func setupUI(){
        timelineTableView.delegate = self
        timelineTableView.dataSource = self
    }
    
    private func setupAddSubView(){
        view.addSubview(timelineTableView)
    }
}


// MARK: - @OBJC Funcs
extension HomeViewController{
    @objc func didTapProfileImage(){
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
}




//M@ARK: - TableView Delegetes
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else{
            return UITableViewCell()
        }
        
        cell.delegete = self
        return cell
    }
    
    
   
}

// MARK: - Protocol
extension HomeViewController: TweetTableViewCellDelegeteProtocol{
    func tweetTableViewCellDidTapReply() {
        print("Reply")
    }
    
    func tweetTableViewCellDidTapRetweet() {
        print("Retweet")
    }
    
    func tweetTableViewCellDidTapLike() {
        print("Like")
    }
    
    func tweetTableViewCellDidTapShare() {
        print("Share")
    }
    
          
}
