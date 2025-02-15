//
//  Note.swift
//  NotesApp
//
//  Created by Иван Курганский on 13/02/2025.
//

import Foundation

struct Note: TableViewItemProtocol {
    let title: String
    let description: String
    let data: Data
    let imageURL: String?
    let image: Data?
}
