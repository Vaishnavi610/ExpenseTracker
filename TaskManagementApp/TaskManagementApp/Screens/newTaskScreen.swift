//
//  newTaskScreen.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 01/02/24.
//

import SwiftUI

struct newTaskScreen: View {
    
    @State var selectScheduleDate : Date = Date()
    @State var selectDueDate : Date = Date()
    
    @State var title : String = ""
    @State var note : String = ""
    @State var repeatedValue : String = "Never"
    @State var seletctedTheme : String = "pinkLabel"
    @State var seletctedUrl : String = ""
    @State var seletctedAlertValue : String = "None"
    
    @State var isCompleted : Bool = false
    @State var alertOn : Bool = false
    
    @FocusState private var focusField: Field?
    
    @StateObject var viewModel = tasksViewModel()
 
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 40){
                VStack(spacing: 15){
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 51, height: 4, alignment: .center)
                        .foregroundStyle(Color.gray.opacity(0.6))
                    
                    
                    Text("New Task")
                        .font(.custom(fontNames.medium.rawValue, size: 24))
                }
                
                VStack(alignment: .leading){
                    Text("Task Title")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                    TextField("Add title to your task.", text: $title)
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                }.padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                
                HStack{
                    Text("Schedule on")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                    DatePicker("", selection: $selectScheduleDate, displayedComponents: [.date, .hourAndMinute])
                }.padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                HStack{
                    Text("Due date")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                    DatePicker("", selection: $selectDueDate, displayedComponents: [.date, .hourAndMinute])
                }.padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                VStack(alignment: .leading){
                    Text("Note")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                    TextField("Add some note about tasks..", text: $note, axis: .vertical)
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                }.padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                HStack(alignment: .center, spacing: 10){
                    Text("Repeat")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    Spacer()
                 
                        Text(repeatedValue)
                            .font(.custom(fontNames.regular.rawValue, size: 16))
                }
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Select theme")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                    themeBar()
                }
                .padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                HStack {
                    Image("clock")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Get notified")
                            .font(.custom(fontNames.medium.rawValue, size: 16))
                        
                        Text("We notify you about this task on time that you specified here.")
                            .font(.custom(fontNames.medium.rawValue, size: 14)).foregroundStyle(Color.gray.opacity(0.8))
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                    }
                    .frame(width: 250)
                    
                    Toggle(isOn: $alertOn, label: {
                        
                    })
                    .tint(.black)
                    .onTapGesture {
                        withAnimation (.easeInOut){
                            alertOn.toggle()
                        }
                    }
                }
                .padding(.horizontal, 5)
                
                if alertOn{
                    HStack(alignment: .center, spacing: 10){
                        Text("Alert")
                            .font(.custom(fontNames.regular.rawValue, size: 16))
                        Spacer()
                     
                            Text(repeatedValue)
                                .font(.custom(fontNames.regular.rawValue, size: 16))
                    }
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                            .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                            .foregroundStyle(Color.clear)
                    }

                }
                
                VStack(alignment: .leading){
                    Text("URL")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                    TextField("", text: $seletctedUrl)
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                }.padding(.horizontal, 10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color.black ,style: StrokeStyle(lineWidth: 0.5))
                        .frame(width: UIScreen.main.bounds.width - 20, height: 60)
                        .foregroundStyle(Color.clear)
                }
                
                Button {
                   
                    if title != "" && note != ""  {
                        viewModel.crateTasks(taksName: title, note: note, createdDate: selectScheduleDate, dueDate: selectDueDate, isCompleted: isCompleted, setAlram: alertOn, alertValue: seletctedAlertValue, repeatValue: repeatedValue, urlAttachment: seletctedUrl) { result in
                            if result{
                                dismiss()
                            }
                        }
                    }else{
                        
                    }
                    
                } label: {
                    Text("Save")
                        .foregroundStyle(Color.white)
                        .font(.custom(fontNames.medium.rawValue, size: 24))
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 273, height: 60)
                                .foregroundStyle(Color.black)
                        }
                }

                
            }
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    @ViewBuilder
    func themeBar () -> some View{
        HStack(alignment: .center, spacing: 20, content: {
            ForEach(viewModel.themeColorArray.indices, id: \.self) { element in
                Circle()
                    .fill(Color(viewModel.themeColorArray[element]))
                    .frame(width: 30, height: 30)
                    .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
                  
            }
            
        })
    }
    
   
    
}

#Preview {
    newTaskScreen()
}
