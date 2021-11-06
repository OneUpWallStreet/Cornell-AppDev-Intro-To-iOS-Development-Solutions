import UIKit

class CafetariaTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var ratingLabel = UILabel()
    var heartImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        ratingLabel.font = .systemFont(ofSize: 12)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingLabel)
        
        heartImage.image = UIImage(named: "heart")
        heartImage.contentMode = .scaleAspectFit
        heartImage.isHidden = true
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(heartImage)
     
        SetUpConstraints()
        
    }
    
    func configure(cafetaria: Cafeteria){
        
        nameLabel.text = cafetaria.name
        ratingLabel.text = "Rating: \(cafetaria.getRatingString())"
        
    }
    
    func SetUpConstraints() {
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            heartImage.heightAnchor.constraint(equalToConstant: 16),
            heartImage.widthAnchor.constraint(equalToConstant: 16),
            heartImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heartImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
        
    }
    
    func toggleHeart(isFav: Bool) {
        heartImage.isHidden = !isFav
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
