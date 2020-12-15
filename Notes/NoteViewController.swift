//
//  NoteViewController.swift
//  Notes
//
//  Created by Marcus Lee on 15/12/2020.
//

import UIKit

class NoteViewController: UIViewController {
    var note: Note!
    
    @IBOutlet var textView: UITextView!
    
    // MARK: View setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display the note from contents
        textView.text = note.contents
    }
    
    // When view disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Set contents to current text displayed
        note.contents = textView.text
        
        // Save the note to db
        NoteManager.main.save(note: note) 
    }
    
    // Delete button implementation
    @IBAction func deleteNote() {
        // Delete the current note
        NoteManager.main.delete(note: note)
        
        // Pop current view and go back to list view
        navigationController?.popViewController(animated: true)
    }
}
