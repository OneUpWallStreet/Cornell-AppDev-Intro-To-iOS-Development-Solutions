//
//  ViewController.swift
//  Cynthia
//
//  Created by Arteezy on 11/4/21.
//

import UIKit

class ViewController: UIViewController {

    var nameLabel: UILabel = UILabel()
    var profileImageView: UIImageView = UIImageView()
    var followButton: UIButton = UIButton()
    var bioTextView: UITextView = UITextView()
    var commentTextField: UITextField = UITextField()
    var isFollowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        nameLabel.text = "Craig Federighi"
        nameLabel.textColor = UIColor.black
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        profileImageView.image = UIImage(named: "craig")
        profileImageView.layer.cornerRadius = 5
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.systemBlue, for: .normal)
        followButton.layer.cornerRadius = 10
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        view.addSubview(followButton)
        
        commentTextField.placeholder = "Comment Here"
        commentTextField.textColor = .black
        commentTextField.font = .systemFont(ofSize: 15)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentTextField)
        
        bioTextView.text = "Craig Federighi is Apple’s senior vice president of Software Engineering, reporting to CEO Tim Cook. Craig oversees the development of iOS and macOS. His teams are responsible for delivering the software at the heart of Apple’s innovative products, including the user interface, applications and frameworks. Craig returned to Apple in 2009 to lead macOS engineering, and in 2012 took on responsibility for iOS as well, delivering all subsequent releases of the world’s most advanced desktop and mobile operating systems. Prior to his return, Craig worked at NeXT, followed by Apple, and then spent a decade at Ariba, an internet e-commerce pioneer where he held several roles including chief technology officer. Craig holds a Master of Science degree in Computer Science and a Bachelor of Science in Electrical Engineering and Computer Science from the University of California, Berkeley."
        bioTextView.font = .systemFont(ofSize: 12)
        bioTextView.textAlignment = .left
        bioTextView.textColor = UIColor.black
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextView)
        
        setUpConstaints()
    }
    
    @objc func followButtonTapped() {
        if isFollowing != true {
            isFollowing = true
            followButton.setTitle("Following", for: .normal)
        }
        else{
            isFollowing = false
            followButton.setTitle("Follow", for: .normal)
        }
    }
    
    func setUpConstaints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.heightAnchor.constraint(equalToConstant: 50),
            followButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            commentTextField.heightAnchor.constraint(equalToConstant: 70),
            commentTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 20),
            bioTextView.bottomAnchor.constraint(equalTo: commentTextField.topAnchor, constant: -20),
            bioTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        ])
    }


}

