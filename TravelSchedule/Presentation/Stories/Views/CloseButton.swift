//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.06.2024.
//

import SwiftUI

struct CloseButton: View {
    
    // MARK: - Properties
    
    let action: () -> Void

    // MARK: - Body
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
           Image("closeButton")
        })
    }
}

#Preview {
    CloseButton(action: {})
}
