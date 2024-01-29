//
//  recentTransactionView.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 24/01/24.
//

import SwiftUI

struct recentTransactionView: View {
    var body: some View {
        HStack{
            Image(categories.cafe.imageName)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    recentTransactionView()
}
