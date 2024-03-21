//
//  HomeViewController.swift
//  twitterApp
//
//  Created by Bircan Sezgin on 3/22/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private let timelineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAddSubView()
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





//M@ARK: - TableView Delegetes
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Hello World's TWEET"
        
        return cell
    }
}
