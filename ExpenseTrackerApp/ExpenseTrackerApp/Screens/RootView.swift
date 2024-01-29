//
//  RootView.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 23/01/24.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTabs : selectedTabs = .home
    
    var body: some View {
        ZStack{
            
            switch selectedTabs {
            case .home:
                HomePage()
            case .transactions:
                TransactionPage()
            case .newTransactions:
                newTransactionPage()
            case .statistics:
                statisticsPage()
            case .profile:
                ProfilePage()
            }
            
            CustomeTabBar(selectedTab: $selectedTabs)
                .padding(.top, UIScreen.main.bounds.height - 120)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    RootView()
}
