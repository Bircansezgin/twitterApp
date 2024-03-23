//
//  ProfileHeader.swift
//  twitterApp
//
//  Created by Bircan Sezgin on 3/22/24.
//

import UIKit
import SnapKit
class ProfileTableViewHeader: UIView {
    
    private let profileHeaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "header")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let avatarProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(systemName: "person")
        imageView.backgroundColor = .yellow
        return imageView

    }()
    
    private let displayNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Bircan Sezgin"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22,weight: .bold)
        return label
        
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@brcnszgn2"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17,weight: .regular)
        label.textColor = .systemGray2
        return label
    }()
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 15,weight: .semibold)
        label.text = "IOS DEV."
        label.textColor = .white
        return label
    }()

    private let joinDateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let joinDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Joined April 25"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14,weight: .regular)
        label.textColor = .systemGray2
        return label
    }()
   
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstrait()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension ProfileTableViewHeader{
    private func configureConstrait(){
        
        
        addSubview(profileHeaderImageView)
        profileHeaderImageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(snp.top)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(180)
        }
        
        addSubview(avatarProfileImageView)
        avatarProfileImageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(10)
            make.centerY.equalTo(profileHeaderImageView.snp.bottom).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        
        addSubview(displayNameLabel)
        displayNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarProfileImageView.snp.leading)
            make.top.equalTo(avatarProfileImageView.snp.bottom).offset(10)
        }
        
        addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalTo(displayNameLabel.snp.leading)
            make.top.equalTo(displayNameLabel.snp.bottom)
        }
        
        addSubview(userBioLabel)
        userBioLabel.snp.makeConstraints { make in
            make.leading.equalTo(usernameLabel.snp.leading)
            make.trailing.equalTo(snp.trailing).offset(-5)
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
        }
        
        
        addSubview(joinDateImageView)
        joinDateImageView.snp.makeConstraints { make in
            make.leading.equalTo(userBioLabel.snp.leading)
            make.top.equalTo(userBioLabel.snp.bottom).offset(8)
        }
        
        addSubview(joinDateLabel)
        joinDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(joinDateImageView.snp.trailing).offset(2)
            make.bottom.equalTo(joinDateImageView.snp.bottom)
        }
        
    }
}
