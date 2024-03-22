import UIKit
import SnapKit




// MARK: - Protocol
protocol TweetTableViewCellDelegeteProtocol: AnyObject{
    func tweetTableViewCellDidTapReply()
    func tweetTableViewCellDidTapRetweet()
    func tweetTableViewCellDidTapLike()
    func tweetTableViewCellDidTapShare()
}


class TweetTableViewCell: UITableViewCell {
    
    weak var delegete: TweetTableViewCellDelegeteProtocol?
    static let identifier = "TweetTableViewCell"
    private let actionsSpacing: CGFloat = 60
    
    //MARK: - Views
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "house")
        imageView.tintColor = .secondarySystemFill
        
        return imageView
    }()
    
    // displayNameLabel
       private let displayNameLabel : UILabel = {
           
           let displayNameLabel = UILabel()
           displayNameLabel.text = "Bircan Sezgin"
           displayNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
           displayNameLabel.translatesAutoresizingMaskIntoConstraints = false
           return displayNameLabel
           
       }()
       
       // usernameLabel
       let usernameLabel : UILabel = {
           
           let usernameLabel = UILabel()
           usernameLabel.text = "@candev"
           usernameLabel.textColor = .secondaryLabel
           usernameLabel.font = .systemFont(ofSize: 15, weight: .regular)
           usernameLabel.translatesAutoresizingMaskIntoConstraints = false
           return usernameLabel
           
       }()
    
    // Comment!
    let tweetTextContentLabel : UILabel = {
        let twLabel = UILabel()
        twLabel.translatesAutoresizingMaskIntoConstraints = false
        twLabel.text = "This is my first Tweet, I love you Mom. your son loves you very much. I am Bircan Sezgin. I am Mobile Developer"
        twLabel.numberOfLines = 0
        
        return twLabel
        
    }()
    
    
    private let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConstraints()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setup Button
    
    @objc private func didTapReply(){
        delegete?.tweetTableViewCellDidTapReply()
    }
    
    @objc private func didTapRetweet(){
        delegete?.tweetTableViewCellDidTapRetweet()

    }
    
    @objc private func didTapLike(){
        delegete?.tweetTableViewCellDidTapLike()

    }
    
    @objc private func didTapShare(){
        delegete?.tweetTableViewCellDidTapShare()

    }
    
    
    private func configureButton(){
        replyButton.addTarget(self, action: #selector(didTapReply), for: .touchUpInside)
        retweetButton.addTarget(self, action: #selector(didTapRetweet), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(didTapShare), for: .touchUpInside)

    }
    
    //MARK: - Constraints
    private func configureConstraints() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
        
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.top.equalTo(contentView.snp.top).offset(14)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        displayNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(10)
            make.top.equalTo(contentView.snp.top).offset(20)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalTo(displayNameLabel.snp.trailing).offset(10)
            make.centerY.equalTo(displayNameLabel.snp.centerY)
        }
        
        tweetTextContentLabel.snp.makeConstraints { make in
            make.leading.equalTo(displayNameLabel.snp.leading)
            make.top.equalTo(displayNameLabel.snp.bottom).offset(5)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
        }
        
        replyButton.snp.makeConstraints { make in
            make.leading.equalTo(tweetTextContentLabel.snp.leading)
            make.top.equalTo(tweetTextContentLabel.snp.bottom).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
        }
        
        retweetButton.snp.makeConstraints { make in
            make.leading.equalTo(replyButton.snp.trailing).offset(actionsSpacing)
            make.centerY.equalTo(replyButton)
            
        }
        
        likeButton.snp.makeConstraints { make in
            make.leading.equalTo(retweetButton.snp.trailing).offset(actionsSpacing)
            make.centerY.equalTo(replyButton.snp.centerY)
        }
        
        shareButton.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.trailing).offset(actionsSpacing)
            make.centerY.equalTo(replyButton.snp.centerY)
        }
        
    }
}
