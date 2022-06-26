//
//  FeedCell.swift
//  instagram
//
//  Created by teewhy on 6/6/22.
//

import UIKit

class FeedCell: UICollectionViewCell{
    
    // MARK: - Properties
    
    private let profileimageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Venom", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        return button
    }()

    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
    let label = UILabel()
        label.text = "1 likes"
        label.font =  UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionLabel: UILabel = {
    let label = UILabel()
        label.text = "Some text here..."
        label.font =  UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private let postTimeLabel: UILabel = {
    let label = UILabel()
        label.text = "2 days ago"
        label.font =  UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - Lifecycle
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileimageView)
        profileimageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileimageView.setDimensions(height: 40, width: 40)
        profileimageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileimageView)
        usernameButton.anchor(left: profileimageView.rightAnchor, paddingLeft: 8)
  
        
        addSubview(postImageView)
        postImageView.anchor(top: profileimageView.bottomAnchor, left: leftAnchor,
                            right: rightAnchor, paddingTop: 8)
        postImageView.setHeight(frame.width)
        //postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)

        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
   @objc func didTapUsername(){
       print("Debug: did tap username")
   }
    
    // MARK: - Helpers

    func configureActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, left: leftAnchor, width: 120, height: 50)
    }
}

