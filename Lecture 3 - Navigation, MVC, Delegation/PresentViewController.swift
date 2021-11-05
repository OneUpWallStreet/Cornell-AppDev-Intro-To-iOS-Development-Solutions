//
//  PresentViewController.swift
//  Cynthia
//
//  Created by Arteezy on 11/5/21.
//

import UIKit

class PresentViewController: UIViewController {
    
    var viewTitle: UILabel = UILabel()
    var commentBox: UITextField = UITextField()
    var submitButton: UIButton = UIButton()
    var delegate: UpdateTitleDelegate
    var placeholderText: String?
    
    init(delegate: UpdateTitleDelegate,placeholderText: String){
        self.delegate = delegate
        self.placeholderText = placeholderText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        viewTitle.text = "Present"
        viewTitle.textColor = UIColor.red
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTitle)
        
        commentBox.placeholder = placeholderText
        commentBox.textColor = UIColor.blue
        commentBox.layer.borderWidth = 1
        commentBox.layer.borderColor = UIColor.white.cgColor
        commentBox.textColor = UIColor.black
        commentBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentBox)
            
        submitButton.setTitle("Submit", for: .normal)
        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 5
        submitButton.setTitleColor(.blue, for: .normal)
        submitButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
    
        SetConstraints()
    }
    
    @objc func dismissViewController(){
        delegate.UpdateTitle(newString: commentBox.text!)
        dismiss(animated: true, completion: nil)
    }
    
    func SetConstraints() {
        
        NSLayoutConstraint.activate([
            viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            viewTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            commentBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentBox.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            commentBox.widthAnchor.constraint(equalToConstant: 250),
            commentBox.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
//            submitButton.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 20),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            submitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 250),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    
    
}
