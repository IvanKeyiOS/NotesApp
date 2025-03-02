//
//  NotesListViewModel.swift
//  NotesApp
//
//  Created by Иван Курганский on 13/02/2025.
//

import Foundation

protocol NotesListViewModelProtocol {
    var section: [TableViewSection] { get }
    var reloadTable: (() -> Void)? { get set }
    
    func getNotes()
}

final class NotesListViewModel: NotesListViewModelProtocol {
    var reloadTable: (() -> Void)?
    private(set) var section: [TableViewSection] = [] {
        didSet {
            reloadTable?()
        }
    }
    
    init() {
        getNotes()
//        setMocks()
    }
    func getNotes() {
        let notes = NotePersistent.fetchAll()
        section = []
        
        let groupedObjects = notes.reduce(into: [Date: [Note]]()) { result, note in
            let date = Calendar.current.startOfDay(for: note.date)
            result[date, default: []].append(note)
        }
        
        let keys = groupedObjects.keys
        
        keys.forEach { key in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMM yyyy"
            let stringDate = dateFormatter.string(from: key)
            
            section.append(TableViewSection(title: stringDate,
                                            item: groupedObjects[key] ?? []))
        }
        
    }
    
    
        
    private func setMocks() {
        let section = TableViewSection(title: "13 Feb 2025",
                                       item: [
                                        Note(title: "First note",
                                             description: "First note description",
                                             data: Data(),
                                             imageURL: nil,
                                             image: nil,
                                             category: nil),
                                        Note(title: "First note",
                                             description: "First note description",
                                             data: Data(),
                                             imageURL: nil,
                                             image: nil,
                                             category: nil)
                                                   description: "First note description",
                                                   date: Date(),
                                                   imageURL: nil),
                                        Note(title: "First note",
                                                   description: "First note description",
                                                   date: Date(),
                                                   imageURL: nil)
                                       ])
        self.section = [section]
    }
}

