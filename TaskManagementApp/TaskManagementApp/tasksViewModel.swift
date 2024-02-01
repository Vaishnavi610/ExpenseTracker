//
//  tasksViewModel.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 01/02/24.
//

import Foundation
import SwiftUI
import CoreData

class tasksViewModel : ObservableObject {
    
    let viewContext = PersistenceController.shared.viewContext
    
    @State var themeColorArray : [Color] = [.pinkLabel, .blueLabel, .blackLabel, .brownLabel, .purpleLabel, .redLabel, .skyBlueLabel]
    
    @Published var userTasksData : [Tasks_data] = []
    
    init(){
        fetchData ()
    }
    
    func fetchData (){
        let request = NSFetchRequest<Tasks_data>(entityName: "Tasks_data")
        do{
            userTasksData = try viewContext.fetch(request)
        }catch{
            
        }
        print("array", userTasksData[0].taskaname)
    }
    
    func crateTasks (taksName: String,  note: String,  createdDate: Date,  dueDate: Date,  isCompleted : Bool,  setAlram: Bool, alertValue: String, repeatValue : String, urlAttachment : String, completionHandler : @escaping (_ success : Bool)-> Void){
        tasksDataHelper.shared.createTasks(taksName, note, createdDate, dueDate, isCompleted, setAlram, alertValue, repeatValue, urlAttachment, viewContext) { success in
            if success{
                self.fetchData()
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        }
    }
    
    
}
