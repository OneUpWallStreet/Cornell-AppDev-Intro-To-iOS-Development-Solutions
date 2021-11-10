

import UIKit

class CourseDetailViewController: UIViewController {

    // MARK: UI components
    let tableView = UITableView()

    // MARK: Data variables
    var course: Course

    // MARK: Constants
    let reuseIdentifier = "AssignmentTableViewCellReuse"

    init(course: Course) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = course.code
        view.backgroundColor = .white

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AssignmentTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        view.addSubview(tableView)

        setupConstraints()
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - Table view data source
extension CourseDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.assignments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? AssignmentTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(for: course.assignments[indexPath.row])
        return cell
    }
}

// MARK: - Table view delegate
extension CourseDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


