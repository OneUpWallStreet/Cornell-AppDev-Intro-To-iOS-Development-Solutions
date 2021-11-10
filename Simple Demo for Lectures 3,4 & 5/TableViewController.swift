//
//  TableViewController.swift
//  Demo
//
//  Created by Arteezy on 11/7/21.
//

import UIKit

func CreateAlbum() -> Array<TableModel>{

    let darkSide = TableModel(albumName: "Dark Side Of The Moon", songCount: 10, artistName: "Pink Floyd", releaseDate: 1973, rating: .wow)
    let borntorun = TableModel(albumName: "Born To Run", songCount: 10, artistName: "Bruce Springsteen", releaseDate: 1972, rating: .wow)
    let lifeOfPablo = TableModel(albumName: "Life Of Pablo", songCount: 20, artistName: "Kanye West", releaseDate: 2016, rating: .great)
    let damn = TableModel(albumName: "DAMN", songCount: 8, artistName: "Kendrick Lamar", releaseDate: 2017, rating: .good)
    return [darkSide,borntorun,lifeOfPablo,damn]
}

class TableViewController: UITableViewController {

    var table: UITableView = UITableView()
    let reuseIdentifier: String = "albumCellReuse"
    var albums: Array<TableModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Table View!!"
        view.backgroundColor = UIColor.white
        albums = CreateAlbum()
                    
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        self.table.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(table)
        SetUpConstraints()
    }
    
    func SetUpConstraints() {

        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            table.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            table.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var album = albums[indexPath.row]
        let cell = table.cellForRow(at: indexPath) as! CustomTableViewCell
        album.isFav.toggle()
        cell.toggleSurprise(album.isFav)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell = table.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CustomTableViewCell
        let album = albums[indexPath.row]
        cell.configure(album: album)
        cell.selectionStyle = .none
        return cell
}

    

}


