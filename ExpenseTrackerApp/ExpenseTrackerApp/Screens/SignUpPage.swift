//
//  SignUpPage.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 23/01/24.
//

import SwiftUI

struct SignUpPage: View {
    var body: some View {
        VStack{
            
            Image("ExpensifyLogo")
                .frame(width: 100, height: 100)
            
            
            VStack(alignment: .leading, spacing: 20, content: {
                
                Text("Sign Up")
                    .font(.title)
                
                
                
            })
            
            
        }
    }
}

#Preview {
    SignUpPage()
}
