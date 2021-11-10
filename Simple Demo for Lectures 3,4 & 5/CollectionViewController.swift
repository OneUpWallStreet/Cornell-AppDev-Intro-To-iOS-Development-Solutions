//
//  CollectionViewController.swift
//  Demo_2
//
//  Created by Arteezy on 11/10/21.
//

import UIKit

//private let reuseIdentifier = "Cell"
func CreateCollectionData() -> Array<CollectionModel> {
    var array: Array<CollectionModel> = []
    array.append(CollectionModel(imageName: "1"))
    array.append(CollectionModel(imageName: "2"))
    array.append(CollectionModel(imageName: "3"))
    array.append(CollectionModel(imageName: "4"))
    return array
}

class CollectionViewController: UICollectionViewController {

    var collection: UICollectionView!
    var data: Array<CollectionModel> = []
    let cellPading: CGFloat = 10
    let sectionPadding: CGFloat = 15
    let reuseIdentifierCollection = "collectionIdentifierNew"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UICollection"
        data = CreateCollectionData()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = cellPading
        layout.minimumLineSpacing = sectionPadding
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCollection)
        collection.delegate = self
        collection.dataSource = self
        view.addSubview(collection)
        
        SetUpConstraints()
        
    }
    
    func SetUpConstraints() {
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = data[indexPath.item]
        print("album selected is: \(album.imageName)")
        album.isSelected.toggle()
        collection.reloadData()
    }
  
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCollection, for: indexPath) as! CustomCollectionViewCell
        cell.configure(albumImageData: data[indexPath.item])
        return cell
    }
}



extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 12) / 2
        return CGSize(width: size, height: size)
    }
    
}
