

import UIKit

class CourseTableViewCell: UITableViewCell {

    var nameLabel = UILabel()
    var codeLabel = UILabel()

    let padding: CGFloat = 8
    let nameLabelHeight: CGFloat = 16

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        codeLabel = UILabel()
        codeLabel.textColor = .gray
        codeLabel.font = .systemFont(ofSize: 14)
        codeLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(nameLabel)
        contentView.addSubview(codeLabel)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
        ])

        NSLayoutConstraint.activate([
            codeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: padding),
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            codeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            codeLabel.heightAnchor.constraint(equalToConstant: nameLabelHeight)
        ])
    }

    func configure(for course: Course) {
        nameLabel.text = course.name
        codeLabel.text = course.code
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
