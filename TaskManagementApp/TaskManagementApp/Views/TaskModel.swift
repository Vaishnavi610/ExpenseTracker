//
//  TaskModel.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import Foundation
import SwiftUI



struct taskModel : Identifiable{
    var id = UUID().uuidString
    var taskName : String
    var taskDate : Date = .init()
    var note : String
    var alert : Bool
    var theme : Color
    var isCompleted : Bool
}




//sample task
var sampleTask : [taskModel] = [

    .init(taskName: "Standup call", taskDate: Date.now, note: "Discuss regarding today’s task", alert: false, theme: .blackLabel, isCompleted: false),
    .init(taskName: "Meeting with client", taskDate: Date.now, note: "setup call before 11", alert: false, theme:.skyBlueLabel, isCompleted: false),
    .init(taskName: "Meeting with client", taskDate: Date.now, note: "", alert: false, theme: .purpleLabel, isCompleted: false),
    .init(taskName: "Design Logo", taskDate: Date.now, note: "Do research on logo.", alert: false, theme: .pinkLabel, isCompleted: true),
    .init(taskName: "Design Logo", taskDate: Date.now, note: "Do research on logo.", alert: false, theme: .pinkLabel, isCompleted: true),
    .init(taskName: "Design Logo", taskDate: Date.now, note: "Do research on logo.", alert: false, theme: .brownLabel, isCompleted: true)

]
