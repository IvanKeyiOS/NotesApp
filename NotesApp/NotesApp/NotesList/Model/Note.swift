//
//  Note.swift
//  NotesApp
//
//  Created by Иван Курганский on 13/02/2025.
//

import Foundation

struct Note: TableViewItemProtocol {
    let title: String
    let description: String?
    let date: Date
    let imageURL: URL?
    let image: Data? = nil
}
