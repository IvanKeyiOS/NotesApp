//
//  NoteEntity+CoreDataProperties.swift
//  NotesApp
//
//  Created by Иван Курганский on 22/02/2025.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var textDescription: String?
    @NSManaged public var date: Date?
    @NSManaged public var imageURL: URL?

}

extension NoteEntity : Identifiable {

}
