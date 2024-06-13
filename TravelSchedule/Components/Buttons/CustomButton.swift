//
//  CustomButton.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

struct CustomButton: View {
    
    //MARK: - Properties
    
    let title: String
    let isRedDot: Bool
    
    //MARK: - Init
    
    init(
        title: String,
        isRedDot: Bool
    ) {
        self.title = title
        self.isRedDot = isRedDot
    }
    
    //MARK: - View
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color.YP.blue)
            .frame(height: 60)
            .cornerRadius(15)
            .overlay {
                HStack {
                    Text(title)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Color.YP.whiteU)
                    if isRedDot {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color.YP.red)
                            .frame(
                                width: 8,
                                height: 8
                            )
                    }
                }
            }
    }
}

#Preview {
    CustomButton(
        title: "Button",
        isRedDot: true
    )
}
