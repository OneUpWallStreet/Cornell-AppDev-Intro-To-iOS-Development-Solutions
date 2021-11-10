

import UIKit

class AssignmentTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var dueDateLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 14)

        dueDateLabel = UILabel()
        dueDateLabel.textColor = .gray
        dueDateLabel.font = .systemFont(ofSize: 14)

        contentView.addSubview(titleLabel)
        contentView.addSubview(dueDateLabel)

        setupConstraints()
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(16)
        }

        dueDateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(16)
        }
    }

    func configure(for assignment: Assignment) {
        titleLabel.text = assignment.title
        dueDateLabel.text = assignment.dueDate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

