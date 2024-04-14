//
//  CustomNavBar.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

struct CustomNavBar: View {
    
    // MARK: - Properties
    
    let actionForLeftButton: () -> ()
    let title: String
    
    // MARK: - Init
    
    init(
        actionForLeftButton: @escaping () -> (),
        title: String
    ) {
        self.actionForLeftButton = actionForLeftButton
        self.title = title
    }
      
    // MARK: - Body
    
    var body: some View {
        HStack {
            Button {
                actionForLeftButton()
            } label: {
                Image(
                    systemName: "chevron.backward"
                )
                .foregroundStyle(Color.YP.black)
            }
            .padding(.leading, 8)
            
            Text(title)
                .foregroundStyle(Color.YP.black)
                .font(.system(size: 17, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.trailing, 36)
        }
    }
}
