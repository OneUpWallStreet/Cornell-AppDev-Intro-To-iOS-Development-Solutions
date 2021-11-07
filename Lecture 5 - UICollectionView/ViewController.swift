

import UIKit

class ViewController: UIViewController {

    // TODO 1: set up view
    private var collectionView: UICollectionView!
    
    // Data
    private var sections = ["Circle", "Triangle", "Star", "Umbrella"]
    private var shapes: [[Shape]] = [
        [Shape(imageName: "circle"), Shape(imageName: "circle"), Shape(imageName: "circle"), Shape(imageName: "circle")],
        [Shape(imageName: "triangle"), Shape(imageName: "triangle"), Shape(imageName: "triangle"), Shape(imageName: "triangle")],
        [Shape(imageName: "star"), Shape(imageName: "star"), Shape(imageName: "star"), Shape(imageName: "star")],
        [Shape(imageName: "umbrella"), Shape(imageName: "umbrella"), Shape(imageName: "umbrella"), Shape(imageName: "umbrella")]
    ]

    // TODO 2: set up constants
    private let shapesCellReuseIdentifier = "shapesCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shapes"
        view.backgroundColor = .white

        // TODO 3: Setup flow layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = cellPadding
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.register(ShapesCollectionViewCell.self, forCellWithReuseIdentifier: shapesCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)

        setupConstraints()
    }

   func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shape = shapes[indexPath.section][indexPath.item]
        shape.isSelected.toggle()
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shapes[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shapesCellReuseIdentifier, for: indexPath) as! ShapesCollectionViewCell
        cell.configure(shape: shapes[indexPath.section][indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
        header.configure(for: sections[indexPath.section])
        return header
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfRows: CGFloat = 2
        let size = (collectionView.frame.width - cellPadding) / numOfRows
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    
}
// TODO 6: Conform to UICollectionViewDataSource

// TODO 7: Confrom to UICollectionViewDelegateFlowLayout
// TODO 9: Conform to UICollectionViewDelegate, implement interaction
