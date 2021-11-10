//
//  ViewController.swift
//  Demo
//
//  Created by Arteezy on 11/7/21.
//

import UIKit

class ViewController: UIViewController {

    var menuTitle: UILabel = UILabel()
    var tableButton: UIButton = UIButton()
    var collectionButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Navigation Title!"
        view.backgroundColor = UIColor.white
        menuTitle.text = "My Menu"
        menuTitle.textColor = UIColor.black
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuTitle)
        // Do any additional setup after loading the view.
        
        tableButton.setTitle("Table Button", for: .normal)
        tableButton.layer.borderColor = UIColor.red.cgColor
        tableButton.setTitleColor(.black, for: .normal)
        tableButton.layer.borderWidth = 1
        tableButton.addTarget(self, action: #selector(tableButtonPressed), for: .touchUpInside)
        tableButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableButton)
        
        collectionButton.setTitle("Collection Button", for: .normal)
        collectionButton.setTitleColor(.black, for: .normal)
        collectionButton.layer.borderColor = UIColor.blue.cgColor
        collectionButton.layer.borderWidth = 1
        collectionButton.addTarget(self, action: #selector(collectionButtonPressed), for: .touchUpInside)
        collectionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionButton)
        
        SetUpConstraints()
    }
    
    @objc func tableButtonPressed() {
        let tableVC = TableViewController()
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
    @objc func collectionButtonPressed() {
        let collectionVC = CollectionViewController(collectionViewLayout: UICollectionViewLayout())
        navigationController?.pushViewController(collectionVC, animated: true)
    }

    func SetUpConstraints() {
        
        NSLayoutConstraint.activate([
            menuTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            menuTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableButton.topAnchor.constraint(equalTo: menuTitle.bottomAnchor, constant: 50),
            tableButton.widthAnchor.constraint(equalToConstant: 300),
            tableButton.heightAnchor.constraint(equalToConstant: 50),
            tableButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionButton.topAnchor.constraint(equalTo: tableButton.bottomAnchor, constant: 50),
            collectionButton.widthAnchor.constraint(equalToConstant: 300),
            collectionButton.heightAnchor.constraint(equalToConstant: 50),
            collectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }

}

