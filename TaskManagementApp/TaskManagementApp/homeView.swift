//
//  homeView.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 29/01/24.
//

import SwiftUI

struct homeView: View {
    
    @State var weekSlider : [[Date.weekDay]] = []
    @State var currentWeekIndex : Int = 1
    @State var selectedDate : Date = Date.now
    @State var createWeek : Bool = false
    
    @State var taskData : [taskModel] = sampleTask.sorted (by: { $0.taskDate > $1.taskDate})
     
    //Animation namespace
    @Namespace private var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            VStack(alignment: .leading, spacing: 20) {
                Text("Calendar")
                    .font(.custom(fontNames.bold.rawValue, size: 28))
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                //week slider
                TabView(selection: $currentWeekIndex) {
                    ForEach(weekSlider.indices, id : \.self) {
                         index in
                        let week = weekSlider[index]
                        weekSliderView(week)
                            .padding(.horizontal,10)
                            .tag(index)
                        
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 100)
                .background {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                        .foregroundStyle(Color(hex: "D6E7EB"))
                    
                }
            }
            .frame(maxWidth: .infinity)
            
            Text("Today's Tasks")
                .font(.custom(fontNames.semiBold.rawValue, size: 22))
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                TaskViewFunc()
                    .padding(.vertical)
            }
            .padding(.horizontal)
        }
        .onAppear(perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                weekSlider.append(currentWeek)

                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
            }
            
        })
        .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                createWeek = true
            }
        }
       
    }
    
    @ViewBuilder
    func weekSliderView (_ week : [Date.weekDay]) -> some View {
        HStack(alignment : .center,spacing: 15){
            ForEach(week){ day in
                VStack(alignment : .center,spacing: 10){
                    VStack(alignment : .center,spacing: 10){
                        Text(day.date.format("E"))
                            .font(.custom(isSameDate(day.date, selectedDate) ? fontNames.semiBold.rawValue : fontNames.medium.rawValue, size: 16))
                            .foregroundStyle(isSameDate(day.date, selectedDate) ? Color.white : .gray)
                        
                        Text(day.date.format("dd"))
                            .font(.custom(isSameDate(day.date, selectedDate) ? fontNames.semiBold.rawValue : fontNames.medium.rawValue, size: 16))
                            .foregroundStyle(isSameDate(day.date, selectedDate) ? Color.white : .gray)
                    }
                    
                    if day.date.isToday {
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundStyle(isSameDate(day.date, selectedDate) ? Color.white : Color.black)
                           
                    }
                    
                }.offset(y: day.date.isToday ? 7 : 0)
                .background {
                    if isSameDate(day.date, selectedDate){
                        Rectangle()
                            .frame(width: 50, height: 90)
                            .cornerRadius(20)
                            .foregroundStyle(Color.blackLabel)
//                            .matchedGeometryEffect(id: "TABINDICATOR", in: animation)
                    }
                }
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedDate = day.date
                    }
                }
                
            }
        }
        .background {
            GeometryReader { proxy in
                let minX = proxy.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self, perform: { value in
                        if value.rounded() == 15 && createWeek {
                            paginateWeek()
                            createWeek = false
                        }
                    })
            }
        }
        
    }
    
    func paginateWeek(){
        if weekSlider.indices.contains(currentWeekIndex){
            if let firstDate = weekSlider[currentWeekIndex].first?.date , currentWeekIndex == 0{
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date , currentWeekIndex == (weekSlider.count - 1){
                weekSlider.append(lastDate.createNextWeek() )
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
    }
    
    @ViewBuilder
    func TaskViewFunc() -> some View {
        
        VStack(alignment: .leading, spacing: 30, content: {
            ForEach($taskData.indices, id: \.self) { item in
                TaskView(tasks: $taskData[item], timeDistance: .constant(1))
                    .overlay {
                        if !(item == taskData.count - 1) {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 2, height: 90)
                                .offset(x: -83, y: 30)
                                .foregroundStyle(Color.black)
                        }
                        
                    }
                
            }
            
        })
        
    }
}

#Preview {
    homeView()
}
