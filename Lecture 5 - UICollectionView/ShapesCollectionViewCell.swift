

import UIKit

class ShapesCollectionViewCell: UICollectionViewCell {
    private var shapesImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        shapesImageView.contentMode = .scaleAspectFit
        shapesImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shapesImageView)
        
        setUpConstraints()
    }
    
    func configure(shape: Shape){
        shapesImageView.image = shape.getImage()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            shapesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shapesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shapesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shapesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
