//
//  TaskView.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 31/01/24.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var tasks : taskModel
    @Binding var timeDistance : Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 15, content: {
            
            Text("\(tasks.taskDate.format("HH : MM a"))")
                .font(.custom(fontNames.semiBold.rawValue, size: 16))
                .foregroundStyle(tasks.isCompleted ? Color.gray : Color.black)
                .offset(y: 10)
            
             Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(tasks.isCompleted ? Color.gray : Color.black)
                .offset(y: 10)
            HStack(spacing: 50){
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(tasks.taskName)
                        .font(.custom(fontNames.semiBold.rawValue, size: 16))
                        .foregroundStyle(Color.white)
                    
                    Text(tasks.note)
                        .font(.custom(fontNames.regular.rawValue, size: 12))
                        .foregroundStyle(Color.white)
                })
                
                Label(
                    title: { Text("1 hrs").foregroundStyle(Color.white).font(.custom(fontNames.medium.rawValue, size: 14)) },
                    icon: { Image(systemName: "alarm.fill").foregroundStyle(Color.white) }
                )
                .offset(y: 20)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background( tasks.isCompleted ? Color.gray :  tasks.theme, in: .rect(cornerRadius: 10))
            .shadow(color: Date.now.format("HH : MM a") == tasks.taskDate.format("HH : MM a") ? .gray : .clear, radius: 10, y: 10)
        })
       
    }
}

#Preview {
    homeView()
}
