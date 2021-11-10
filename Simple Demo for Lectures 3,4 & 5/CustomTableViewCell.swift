//
//  TableViewCell.swift
//  Demo
//
//  Created by Arteezy on 11/8/21.
//

import UIKit

extension Int {
    func convertToString(_ number: Int) -> String{
        return "\(number)"
    }
}

class CustomTableViewCell: UITableViewCell {

    let albumName: UILabel = UILabel()
    let songCount: UILabel = UILabel()
    let artistName: UILabel = UILabel()
    let albumRating: UILabel = UILabel()
    let surpriseImage: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print("I want a tea and a slice")
        
        albumName.font = .systemFont(ofSize: 15)
        albumName.textColor = .blue
        albumName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumName)
        
        songCount.font = .systemFont(ofSize: 15)
        songCount.textColor = .blue
        songCount.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songCount)
        
        artistName.font = .systemFont(ofSize: 15)
        artistName.textColor = .blue
        artistName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(artistName)
        
        albumRating.font = .systemFont(ofSize: 15)
        albumRating.textColor = .blue
        albumRating.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumRating)
        
        
        surpriseImage.contentMode = .scaleAspectFit
        surpriseImage.layer.cornerRadius = 5
        surpriseImage.image = UIImage(named: "5")
        surpriseImage.isHidden = true
        surpriseImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(surpriseImage)
                
        SetUpConstraints()
    }
    
    func configure(album: TableModel) {
        
        let songString = album.songCount.convertToString(album.songCount)
        albumName.text = album.albumName
        songCount.text = songString
        artistName.text = album.artistName
        albumRating.text = album.convertRatingToString(album.rating)
        
    }
    
    func toggleSurprise(_ isFav: Bool) {
        print("isFav is: \(isFav)")
        surpriseImage.isHidden = !isFav
        print(surpriseImage.isHidden    )
        
    }
    
    func SetUpConstraints() {
        
        NSLayoutConstraint.activate([
            albumName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            artistName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            artistName.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            songCount.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 10),
            songCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            
        ])
                
        NSLayoutConstraint.activate([
            albumRating.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            surpriseImage.topAnchor.constraint(equalTo: albumRating.bottomAnchor, constant: 10),
            surpriseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            surpriseImage.heightAnchor.constraint(equalToConstant: 46),
            surpriseImage.widthAnchor.constraint(equalToConstant: 46)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
