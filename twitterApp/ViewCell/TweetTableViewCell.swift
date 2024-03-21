import UIKit
import SnapKit

class TweetTableViewCell: UITableViewCell {
    static let identifier = "TweetTableViewCell"
    
    //MARK: - Views
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "house")
        imageView.backgroundColor = .black
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func configureConstraints() {
        contentView.addSubview(avatarImageView)
        
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.top.equalTo(contentView.snp.top).offset(14)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
}
