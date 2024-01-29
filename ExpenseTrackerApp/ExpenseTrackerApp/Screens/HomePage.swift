//
//  HomePage.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 23/01/24.
//

import SwiftUI

struct HomePage: View {
    
    var date : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE, dd MMMM yyyy"
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                VStack(alignment: .leading){
                    Text("Today's Monday ")
                        .font(.custom(Fonts.semiBold.rawValue, size: 28))
                        .foregroundStyle(Color.darkGreenColor)
                    
                    Text("\(date.string(from: Date.now))")
                        .font(.custom(Fonts.medium.rawValue, size: 14))
                        .foregroundStyle(Color.darkGreenColor)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            ZStack{
                VStack(spacing: 20){
                    HStack{
                        Text("Balance")
                            .font(.custom(Fonts.semiBold.rawValue, size: 24))
                            .foregroundStyle(Color.darkGreenColor)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    
                    GaugeStyleProgressView()
                }.padding(.top, 30)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                        .foregroundStyle(Color.faintGreenColor2)
                        .offset(y: -30)
                }
                
                
                HStack(spacing: 20){
                    
                    VStack(spacing: 10){
                        Text("Income")
                            .font(.custom(Fonts.regular.rawValue, size: 14))
                            .foregroundStyle(Color.white)
                        
                        Text("RS. 14,000")
                            .foregroundStyle(Color.white)
                            .font(.custom(Fonts.medium.rawValue, size: 18))
                    }
                    
                    RoundedRectangle(cornerRadius: 30 )
                        .frame(width: 2, height: 50)
                        .foregroundStyle(Color.white)
                    
                    VStack(spacing: 10){
                        Text("Expense")
                            .font(.custom(Fonts.regular.rawValue, size: 14))
                            .foregroundStyle(Color.white)
                           
                        
                        Text("RS. 17,000")
                            .foregroundStyle(Color.white)
                            .font(.custom(Fonts.medium.rawValue, size: 18))
                    }
                    
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 256, height: 70)
                        .foregroundStyle(Color.greenColor)
                }
                .padding(.top, 200)

            }
           
            VStack{
                Text("Recent Transactions")
                    .font(.custom(Fonts.medium.rawValue, size: 24))
                
            }
            
            Spacer()
        }
        .padding(.top, 20)
    }
}

#Preview {
    HomePage()
}



