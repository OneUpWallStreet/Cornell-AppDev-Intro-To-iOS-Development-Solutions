import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()

    let reuseIdentifier = "cafeteriaCellReuse"
    let cellHeight: CGFloat = 50
    var cafetarias: Array<Cafeteria> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Cafeterias"
        view.backgroundColor = .white

        // Initialize tableView
        
        let okensheild = Cafeteria(name: "okensheild", isFavorite: false, rating: CafeteriaRating.terrible)
        let rpcc = Cafeteria(name: "rpcc", isFavorite: false, rating: CafeteriaRating.bad)
        let becker = Cafeteria(name: "becker", isFavorite: false, rating: CafeteriaRating.moderate)
        let appel = Cafeteria(name: "appel", isFavorite: false, rating: CafeteriaRating.great)
        
        cafetarias = [okensheild,rpcc,appel,becker]
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CafetariaTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }

    func setupConstraints() {
//        Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafetarias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CafetariaTableViewCell {
            let cafetaria = cafetarias[indexPath.row]
            cell.configure(cafetaria: cafetaria)
            cell.selectionStyle = .none
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cafetaria = cafetarias[indexPath.row]
        cafetaria.isFavorite.toggle()
        if let cell = tableView.cellForRow(at: indexPath) as? CafetariaTableViewCell {
            cell.toggleHeart(isFav: cafetaria.isFavorite)
        }
        else {
            
        }
    }
}
