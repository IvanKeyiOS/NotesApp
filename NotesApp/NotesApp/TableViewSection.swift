//
//  TableViewSection.swift
//  NotesApp
//
//  Created by Иван Курганский on 13/02/2025.
//

import Foundation

protocol TableViewItemProtocol { }

struct TableViewSection {
    var title: String?
    var item: [TableViewItemProtocol]
}
