//
//  CustomeTabBar.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 23/01/24.
//

import SwiftUI

struct CustomeTabBar: View {
    
    @Binding var selectedTab : selectedTabs
    
    var body: some View {
      
            HStack(spacing: 0){
                Button(action: {
                    withAnimation {
                        selectedTab = .home
                    }
                    
                }, label: {
                    VStack(alignment: .center){
                        Rectangle()
                            .cornerRadius(20, corners: .allCorners)
                            .frame(width: 35, height: 4)
                            .foregroundStyle(selectedTab == .home ? Color.greenColor : Color.white)
                            .shadow(color: selectedTab == .home ? .greenColor : Color.white, radius: 10, x: 0, y: 10)
                        Image(selectedTab == .home ? "home" : "homeHide")
                            .resizable()
                            .frame(width: 30, height:30)
                        Text("Home")
                            .font(.custom(Fonts.regular.rawValue, size: 14))
                            .foregroundStyle(selectedTab == .home ? Color.black : Color.gray)
                  
                    }
                })
                Spacer()
                Button(action: {
                    withAnimation {
                        selectedTab = .transactions
                    }
                }, label: {
                    VStack(alignment: .center){
                        Rectangle()
                            .cornerRadius(20, corners: .allCorners)
                            .frame(width: 35, height: 4)
                            .foregroundStyle(selectedTab == .transactions ? Color.greenColor : Color.white)
                            .shadow(color: selectedTab == .transactions ? .greenColor : Color.white, radius: 10, x: 0, y: 10)
                            .offset(y: 6)
                        Image(selectedTab == .transactions ? "transaction" : "transactionHide")
                            .resizable()
                            .frame(width: 30, height:30)
                        Text("Transactions")
                            .font(.custom(Fonts.regular.rawValue, size: 14))
                            .foregroundStyle(selectedTab == .transactions ? Color.black : Color.gray)
                    
                    }
                })
                
                Spacer()
                Button(action: {
                    withAnimation {
                        selectedTab = .newTransactions
                    }
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.white)
                        .font(.custom(Fonts.semiBold.rawValue, size: 35))
                        .background {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.greenColor)
                        }
                })
                .offset(y: -30)
                Spacer()
                Button(action: {
                    withAnimation {
                        selectedTab = .statistics
                    }
                }, label: {
                    VStack(alignment: .center){
                        Rectangle()
                            .cornerRadius(20, corners: .allCorners)
                            .frame(width: 40, height: 4)
                            .foregroundStyle(selectedTab == .statistics ? Color.greenColor : Color.white)
                            .shadow(color: selectedTab == .statistics ? .greenColor : Color.white, radius: 10, x: 0, y: 10)
                        Image(selectedTab == .statistics ? "growth" : "growthHide")
                            .resizable()
                            .frame(width: 30, height:30)
                        Text("Statistics")
                            .font(.custom(Fonts.regular.rawValue, size: 14))
                            .foregroundStyle(selectedTab == .statistics ? Color.black : Color.gray)
                     
                    }
                })
                
                Spacer()
                Button {
                    withAnimation {
                        selectedTab = .profile
                    }
                } label: {
                    VStack(alignment: .center){
                        Rectangle()
                            .cornerRadius(20, corners: .allCorners)
                            .frame(width: 35, height: 4)
                            .foregroundStyle(selectedTab == .profile ? Color.greenColor : Color.white)
                            .shadow(color: selectedTab == .profile ? .greenColor : Color.white, radius: 10, x: 0, y: 10)
                        Image(selectedTab == .profile ? "avatar" : "avatarHide")
                            .resizable()
                            .frame(width: 30, height:30)
                        Text("Profile")
                            .font(.custom(Fonts.regular.rawValue, size: 14))
                            .foregroundStyle(selectedTab == .profile ? Color.black : Color.gray)
                      
                    }
                }
                
            }.padding(.horizontal, 20)
            .offset(y: -15)
        .background {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 120)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: -10)
        }
        
    }
}

#Preview {
    CustomeTabBar(selectedTab: .constant(.home))
}
