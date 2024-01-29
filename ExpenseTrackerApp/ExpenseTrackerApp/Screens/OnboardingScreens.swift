//
//  OnboardingScreens.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 22/01/24.
//

import SwiftUI

struct OnboardingScreens: View {
    @State var currentIndex : Int = 0
   
    var body: some View {
        VStack(spacing: 40){
            GeometryReader {
                let size = $0.size
                ZStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 250, alignment: .center)
                        .foregroundStyle(Color.lighttGreenColor)
                        .cornerRadius(200, corners: [.bottomLeft])
                        .ignoresSafeArea(.all)
                    
                    ForEach(contentDataSet.indices, id: \.self){ index in
                        screenContent(size: size, index: index)
                            .padding(.top, 150)
                    }
                    
                    
                }
                
                tabItem(currentIndex: currentIndex)
                    .padding(.top, 620)
                    .padding(.leading, UIScreen.main.bounds.width - 120)
                
                HStack{
                    Spacer()
                    Button(action: {
                        if !(currentIndex == 2) {
                            withAnimation(.easeInOut(duration: 0.8)){
                                currentIndex += 1
                            }
                        }else{
                            currentIndex = 0
                        }
                    }, label: {
                        Text("Next")
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                            .background{
                                RoundedRectangle(cornerRadius: 40)
                                    .frame(width: 122, height: 38)
                                    .foregroundStyle(Color.greenColor)
                            }
                    })
                }
                .padding(.horizontal, 60)
                .padding(.top, 750)
                
            }
        }
        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: true)
        .transition(.move(edge: .leading))
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ value in
                if value.translation.width < 0 {
                    // left
                    if !(currentIndex == 2) {
                        withAnimation(.easeInOut(duration: 0.8)){
                            currentIndex += 1
                        }
                    }
                }
                
                if value.translation.width > 0 {
                    // right
                    if !(currentIndex == 0) {
                        withAnimation(.easeInOut(duration: 0.8)){
                            currentIndex -= 1
                        }
                    }
                }
                
            }))
    }
    
    
    @ViewBuilder
    func screenContent(size : CGSize, index : Int) -> some View{
       let introContent = contentDataSet[index]
        VStack(alignment: .leading, spacing: 20){
                Text(introContent.heading)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.faintGreenColor)
//                    .frame(width: 200)
//                    .multilineTextAlignment(.leading)
                    .offset(x : -size.width * CGFloat(currentIndex - index))
                    .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0), value: currentIndex)
                
                Text(introContent.subHeading)
                .font(.system(size: 24))
                .fontWeight(.bold)
                    .foregroundStyle(Color.darkGreenColor)
                    .offset(x : -size.width * CGFloat(currentIndex - index))
                    .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0), value: currentIndex)
                HStack{
                    Spacer()
                    Image(introContent.image)
                        .frame(width: 206, height:  246)
                        .offset(x : -size.width * CGFloat(currentIndex - index))
                        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0), value: currentIndex)
                        .shadow(color: .black.opacity(0.6), radius:10, x: 10, y: 10)
                        .padding(.top, currentIndex == 2 ? -50 : 0)
                }
                .padding(.top, 20)
                
            }
            .padding(.horizontal, 30)
        
    }
    
    @ViewBuilder
    func tabItem(currentIndex: Int) -> some View{
        HStack{
            Circle()
                .frame(width: 28, height: 28)
                .foregroundStyle(currentIndex == 0 ? Color.darkGreenColor : Color.grayColor)
            
            Circle()
                .frame(width: 28, height: 28)
                .foregroundStyle(currentIndex == 1 ? Color.darkGreenColor : Color.grayColor)
            
            Circle()
                .frame(width: 28, height: 28)
                .foregroundStyle(currentIndex == 2 ? Color.darkGreenColor : Color.grayColor)
            
        }
        
        
    }
}

#Preview {
    OnboardingScreens()
}





