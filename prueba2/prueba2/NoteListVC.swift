//
//  NoteListVC.swift
//  prueba2
//
//  Created by Pablo Perpinan on 23/2/24.
//

import Foundation
import UIKit



class NoteListVC: UIViewController, UITableViewDataSource{
   
    @IBOutlet weak var table: UITableView!
    
    var notesList: [Note] = []
    
    var noteDetailVC : NoteDetailVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        let defaults = UserDefaults.standard
        
     //   let count = defaults.integer(forKey: "NotesSaved")
      //  for i in 0...count{
    //        addNote()
     //   }
        
        if let notes = defaults.read([Note].self, key: "NotesSaved"){
            notesList = notes
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let noteDetailVC = storyboard.instantiateViewController(withIdentifier: "NoteDetailVC") as? NoteDetailVC{
            
            noteDetailVC.onCancel = {
                noteDetailVC.dismiss(animated: true)
                
            }
            noteDetailVC.onSave = { title, content in
               
                self.addNote(title: title, content: content)
                self.table.reloadData()
                
             
                
                noteDetailVC.dismiss(animated: true)
            }
            
            self.noteDetailVC = noteDetailVC
         
            
        }
        
      
     
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteCell else{
            return UITableViewCell()
        }
        let note = notesList[indexPath.row]

        cell.label.text = note.title
        cell.texto.text = note.content
        
        cell.onClick = {
            if let noteDetailVC = self.noteDetailVC {
                self.present(noteDetailVC,animated: true)
                noteDetailVC.setMode(mode: .update)
                noteDetailVC.onUpdate = {
                    title, content in
                    cell.label.text = title
                    cell.texto.text = content
                    
                    self.notesList[indexPath.row].title = title
                    self.notesList[indexPath.row].content = content
                    self.saveNoteList()
                    
                    noteDetailVC.dismiss(animated: true)
                }
                
                noteDetailVC.prepare(title: note.title, content: note.content)
                
            }
        }
       return cell
    }
  
    
    
  //  @IBOutlet weak var NoteCell: U ITableView!

    @IBAction func addNoteBtPress(_ sender: Any) {
        if let noteDetailVC = self.noteDetailVC {
            self.present(noteDetailVC,animated: true)
            noteDetailVC.setMode(mode: .create)
            noteDetailVC.clear()
            
        }

    
    }
    
    func addNote(title:String, content: String) {
        notesList.append(
            Note(title: title, content: content)
        )
        
    
    }
    
    func saveNoteList (){
        let defaults = UserDefaults.standard
        defaults.save(data: self.notesList, key:"NotesSaved")
        defaults.synchronize()
    }
}
