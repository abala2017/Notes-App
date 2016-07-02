//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Arjun Balasubramanian on 6/30/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    //static methods will go here
    static func addNote(note: Note){
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    static func removeNote(note: Note){
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
    }
    static func updateNote(noteToBeUpdated : Note, newNote : Note){
        let realm = try! Realm()
        try! realm.write() {
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    static func retrieveNotes() -> Results<Note>{
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
        //How do we know how to sort???
    }
}
