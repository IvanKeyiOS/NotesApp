//
//  Note.swift
//  NotesApp
//
//  Created by Иван Курганский on 13/02/2025.
//

import UIKit

struct Note: TableViewItemProtocol {
    let title: String
<<<<<<< HEAD
    let description: String
    let data: Data
    let imageURL: String?
    let image: Data?
    let category: Category?
}

enum Category: String {
    case personal = "Personal"
    case workOrStudy = "Work or Study"
    case finance = "Finance"
    case travel = "Travel"
    case shopping = "Shopping"
    case hobby = "Hobby"
    case healthy = "Heathy"
    
    var color: UIColor {
        switch self {
        case .personal: return UIColor.systemBlue
        case .workOrStudy : return UIColor.systemGreen
        case .finance : return UIColor.systemTeal
        case .travel : return UIColor.systemOrange
        case .shopping : return UIColor.systemPurple
        case .hobby : return UIColor.systemPink
        case .healthy : return UIColor.systemRed
        }
    }
=======
    let description: String?
    let date: Date
    let imageURL: URL?
    let image: Data? = nil
>>>>>>> main
}
