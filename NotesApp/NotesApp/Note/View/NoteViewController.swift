//
//  NoteViewController.swift
//  NotesApp
//
//  Created by Иван Курганский on 15/02/2025.
//

import SnapKit
import UIKit

final class NoteViewController: UIViewController, UITextViewDelegate {
    //MARK: - GUI Variables
    private let attachmentView: UIImageView = {
        let view = UIImageView()
        
        view.layer.cornerRadius = 10
//        view.image = UIImage(named: "mockImage")
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private let textView: UITextView = {
        let view = UITextView()
        
//        view.text = "Mock text"
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.myRed.cgColor
        
        return view
    }()
    
    //MARK: - Properties
    var viewModel: NoteViewModelProtocol?
   
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupUI()
        
        textView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Methods
    private func configure() {
        
        textView.text = viewModel?.text
        
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.addSubview(attachmentView)
        view.addSubview(textView)
        view.backgroundColor = .white
        
        setupConstraints()
        setImageHeight()
        keyBoard()
        hideBorderTextView()
        setupBars()
    }
    
    private func setupConstraints() {
        attachmentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(attachmentView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.keyboardLayoutGuide.snp.top).inset(-10)
        }
    }
    
    private func setImageHeight() {
        let height =  attachmentView.image != nil ? 200 : 0
            
        attachmentView.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
    }
    private func hideBorderTextView() {
        textView.layer.borderWidth = textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 2 : 0
    }
    
    private func keyBoard() {
        let recognazer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        
        view.addGestureRecognizer(recognazer)
    }
    
    @objc private func hideKeyBoard() {
        textView.resignFirstResponder()
    }
    
   
        
    func setupBars() {
        let spacing = UIBarButtonItem(systemItem: .flexibleSpace)
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash,
                                          target: self,
                                          action: #selector(deleteAction))
        deleteButton .tintColor = .myRed
        
        let addImage = UIBarButtonItem(barButtonSystemItem: .camera,
                                          target: self,
                                          action: #selector(addImage))
        addImage.tintColor = .myRed
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(saveAction))
        UIBarButtonItem.appearance().tintColor = .myRed
        
        setToolbarItems([deleteButton, spacing, addImage], animated: true)
    }
   
    @objc private func saveAction() {
        viewModel?.save(with: textView.text)
        
        navigationController?.popViewController(animated: true)
    }

    @objc private func deleteAction() {
        viewModel?.delete()
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addImage() {
        
    }
}
