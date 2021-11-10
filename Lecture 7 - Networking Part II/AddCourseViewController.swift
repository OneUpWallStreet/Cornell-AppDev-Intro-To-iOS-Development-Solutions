

import UIKit

class AddCourseViewController: UIViewController {

    let codeTextField = UITextField()
    let nameTextField = UITextField()
    let addButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        codeTextField.backgroundColor = .systemGray5
        codeTextField.layer.cornerRadius = 5
        codeTextField.placeholder = "Code"
        view.addSubview(codeTextField)

        nameTextField.backgroundColor = .systemGray5
        nameTextField.layer.cornerRadius = 5
        nameTextField.placeholder = "Name"
        view.addSubview(nameTextField)

        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.layer.cornerRadius = 8
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        view.addSubview(addButton)

        codeTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(35)
            make.top.equalToSuperview().offset(50)
        }

        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(35)
            make.top.equalTo(codeTextField.snp.bottom).offset(20)
        }

        addButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
    }

    @objc func addTapped() {
        if let code = codeTextField.text, let name = nameTextField.text, code != "" && name != "" {
            // TODO: Add course
            NetworkManager.addCourse(code: code, name: name) { course in
                print(course)
            }
            dismiss(animated: true, completion: nil)
        }
    }

}
