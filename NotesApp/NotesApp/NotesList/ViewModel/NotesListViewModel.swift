//
//  NotesListViewModel.swift
//  NotesApp
//
//  Created by Иван Курганский on 13/02/2025.
//

import Foundation

protocol NotesListViewModelProtocol {
    var section: [TableViewSection] { get }
}

final class NotesListViewModel: NotesListViewModelProtocol {
    private(set) var section: [TableViewSection] = []
    
    init() {
        getNotes()
        setMocks()
    }
    
    private func getNotes() {
        
    }
    
    private func setMocks() {
        let section = TableViewSection(title: "13 Feb 2025",
                                       item: [
                                        Note(title: "First note",
                                                   description: "First note description",
                                                   data: Data(),
                                                   imageURL: nil,
                                                   image: nil),
                                        Note(title: "First note",
                                                   description: "First note description",
                                                   data: Data(),
                                                   imageURL: nil,
                                                   image: nil)
                                       ])
        self.section = [section]
    }
}

