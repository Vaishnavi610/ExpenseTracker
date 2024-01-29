//
//  SignUpPage.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 23/01/24.
//

import SwiftUI

struct SignUpPage: View {
    @State var email : String = ""
    @State var pushToHome : Bool = false
    var body: some View {
        VStack(spacing: 70){
            
            Image("ExpensifyLogo")
                .frame(width: 100, height: 100)
            
            
            VStack(alignment: .leading, spacing: 20, content: {
                
                Text("Sign Up")
                    .font(.custom(Fonts.Bold.rawValue, size: 30))
                    .foregroundStyle(Color.black)
                
                Text("Enter your email address to signUp.")
                    .font(.custom(Fonts.regular.rawValue, size: 16))
                
                TextField("email", text: $email)
                    .font(.custom(Fonts.regular.rawValue, size: 16))
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                            .foregroundStyle(Color.gray.opacity(0.2))
                    }
                    .padding(.top, 0)
                
            })
            .padding(.horizontal, 30)
            
            VStack{
                Button(action: {
                    pushToHome = true
                }, label: {
                    Text("Submit")
                        .font(.custom(Fonts.Bold.rawValue, size: 20))                        .foregroundStyle(Color.white)
                        .background {
                            RoundedRectangle(cornerRadius: 40)
                                .frame(width: 321, height: 50)
                                .foregroundStyle(Color.greenColor)
                        }
                })
                
                Text("By registering you certify that you have read and accept terms and conditions.")
                    .font(.custom(Fonts.regular.rawValue, size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
            }.padding(.horizontal, 30)
            
            Spacer()
            
        }
        .navigationDestination(isPresented: $pushToHome, destination: {
            RootView()
        })
        .toolbar(.hidden, for: .navigationBar)
        .padding(.top, 70)
    }
}

#Preview {
    SignUpPage()
}
