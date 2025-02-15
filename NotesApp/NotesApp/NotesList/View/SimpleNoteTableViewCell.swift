//
//  SimpleNoteTableViewCell.swift
//  NotesApp
//
//  Created by Иван Курганский on 12/02/2025.
//

import SnapKit
import UIKit

final class SimpleNoteTableViewCell: UITableViewCell {
    //MARK: - GUI Variables
    private let containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .lightYellow
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title label text"
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    //MARK: - Initializations
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) ha not been implement")
    }
    
    //MARK: - Methods
    func set(note: Note) {
        titleLabel.text = note.title
    }
    
    //MARK: - Private methods
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.trailing.leading.equalToSuperview().inset(5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}

