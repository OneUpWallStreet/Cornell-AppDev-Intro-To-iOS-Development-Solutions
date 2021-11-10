

import UIKit

class CoursesTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var courseNumberLabel: UILabel!
    var instructorLabel: UILabel!

    let padding: CGFloat = 8
    let nameLabelHeight: CGFloat = 16
    let instructorLabelHeight: CGFloat = 14

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        instructorLabel = UILabel()
        instructorLabel.textColor = .gray
        instructorLabel.font = .systemFont(ofSize: 12)
        instructorLabel.translatesAutoresizingMaskIntoConstraints = false

        courseNumberLabel = UILabel()
        courseNumberLabel.textColor = .gray
        courseNumberLabel.font = .systemFont(ofSize: 14)
        courseNumberLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(nameLabel)
        contentView.addSubview(instructorLabel)
        contentView.addSubview(courseNumberLabel)

        setupConstraints()
    }

    func setupConstraints() {
        
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(padding)
            make.height.equalTo(nameLabelHeight)
        }
        
        courseNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(padding)
            make.trailing.equalTo(contentView.snp.trailing).offset(-padding)
            make.top.equalTo(nameLabel.snp.top)
            make.height.equalTo(nameLabel.snp.height)
        }
        
        instructorLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom)
            make.height.equalTo(instructorLabelHeight)
        }
    
    }

    func configure(for course: Course) {
        nameLabel.text = course.name
        courseNumberLabel.text = "(CS \(course.code))"
        instructorLabel.text = course.instructor

        // Cool way of doing an if else statement in one line
        contentView.backgroundColor = course.enrolled ? UIColor.green.withAlphaComponent(0.1) : UIColor.red.withAlphaComponent(0.1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
