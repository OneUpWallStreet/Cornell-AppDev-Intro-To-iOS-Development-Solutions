//
//  ViewController.swift
//  Cynthia
//
//  Created by Arteezy on 11/4/21.
//

import UIKit


protocol UpdateTitleDelegate: AnyObject {
    func UpdateTitle(newString: String)
}

class ViewController: UIViewController {

    var pushButton: UIButton = UIButton()
    var presentButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.black
        navigationItem.title = "view controllers"
        
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
//        pushButton.backgroundColor = UIColor.lightGray
        pushButton.layer.cornerRadius = 5
        pushButton.layer.borderWidth = 1
        pushButton.layer.borderColor = UIColor.yellow.cgColor
        pushButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pushButton)
        
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.white, for: .normal)
        presentButton.layer.borderColor = UIColor.yellow.cgColor
        presentButton.layer.cornerRadius = 5
        presentButton.layer.borderWidth = 1
        presentButton.addTarget(self, action: #selector(presentViewControllerButtonPressed), for: .touchUpInside)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentButton)
    
    
        setUpConstaints()
    }
    
    @objc func pushViewControllerButtonPressed() {
        let vc = PushViewContoller()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func presentViewControllerButtonPressed() {
        
        let vc = PresentViewController(delegate: self, placeholderText: navigationController?.title ?? "default unwrap val")
        present(vc, animated: true, completion: nil)
        
    }
    
    
    func setUpConstaints() {
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushButton.heightAnchor.constraint(equalToConstant: 50),
            pushButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.heightAnchor.constraint(equalToConstant: 50),
            presentButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension ViewController: UpdateTitleDelegate {
    func UpdateTitle(newString: String) {
        navigationItem.title = newString
    }
}

