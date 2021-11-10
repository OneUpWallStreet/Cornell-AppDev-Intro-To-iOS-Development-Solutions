

import SnapKit
import UIKit

class ViewController: UIViewController {

    // MARK: UI components
    let courseTableView = UITableView()
    let refreshControl = UIRefreshControl()

    // MARK: Data variables
    var courses = [Course]()

    // MARK: Constants
    let reuseIdentifier = "ClassTableViewCellReuse"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Courses"
        view.backgroundColor = .white

        navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped)), animated: false)

        courseTableView.delegate = self
        courseTableView.dataSource = self
        courseTableView.register(CourseTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        courseTableView.addSubview(refreshControl)
        view.addSubview(courseTableView)

        setupConstraints()
        getCourses()
    }

    func setupConstraints() {
        courseTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    @objc func addTapped() {
        present(AddCourseViewController(), animated: true, completion: nil)
    }

    // TODO: How do we make a call to the internet to load our shopping cart?
    func getCourses() {
        NetworkManager.getCourses { courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.courseTableView.reloadData()
            }
        }
        
    }

    @objc func refresh() {
        getCourses()
    }

}

// MARK: - Table view data source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CourseTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(for: courses[indexPath.row])
        return cell
    }
}

// MARK: - Table view delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCourse = courses[indexPath.row]
        // TODO: Get course by course id
    }
}

