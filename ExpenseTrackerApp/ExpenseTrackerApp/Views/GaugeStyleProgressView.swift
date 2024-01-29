//
//  GaugeStyleProgressView.swift
//  ExpenseTrackerApp
//
//  Created by vaishnavi Acharekar on 24/01/24.
//

import SwiftUI

struct GaugeStyleProgressView: View {
    
    var body: some View {
        ZStack{
            Circle() .trim(from: 0.0, to: 0.5)
                .stroke(Color.greenColor.opacity(5.4), style:
                            StrokeStyle(
                                lineWidth: 20,
                                lineCap: .round
                            )
                )
                .frame(width: 250, height: 250, alignment: .center)
                
            Circle()
                .trim(from: 0.0, to: 0.3)
                .stroke(Color.darkGreenColor, style:
                            StrokeStyle(
                                lineWidth: 20,
                                lineCap: .round
                            )
                )
                .frame(width: 250, height: 250, alignment: .center)
        }
        .rotationEffect(.degrees(180))
        .background {
           
            VStack{
                Text("65%")
                    .font(.custom(Fonts.semiBold.rawValue, size: 30))
                    .foregroundStyle(Color.greenColor)
                
                Text("you have spent of ")
                    .font(.custom(Fonts.regular.rawValue, size: 16))
                    .foregroundStyle(Color.gray)
                
                Text("RS. 14,000")
                    .font(.custom(Fonts.regular.rawValue, size: 20))
                    .foregroundStyle(Color.darkGreenColor)
            }
            .offset(y: -30)
        }
        
        
    }
}

#Preview {
    GaugeStyleProgressView()
}
