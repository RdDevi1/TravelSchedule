//
//  FilterCell.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

struct FilterCell: View {
    
    // MARK: - Properties
    
    let action: () -> ()
    let title: String
    let isMultipleChoice: Bool
    let isSelected: Bool
    
    // MARK: - Init
    
    init(
        isMultipleChoice: Bool,
        isSelected: Bool,
        title: String,
        action: @escaping () -> ()
        
    ) {
        self.isMultipleChoice = isMultipleChoice
        self.isSelected = isSelected
        self.action = action
        self.title = title
    }
    
    // MARK: - Body
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .font(.system(size: 17))
                    .foregroundStyle(Color.YP.black)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                
                isMultipleChoice
                ? isSelected
                    ? Image(systemName: "checkmark.square.fill")
                        .foregroundStyle(Color.YP.black)
                    : Image(systemName: "square")
                        .foregroundStyle(Color.YP.black)
                
                : isSelected
                    ? Image(systemName: "circle.circle.fill")
                        .foregroundStyle(Color.YP.black)
                    : Image(systemName: "circle")
                        .foregroundStyle(Color.YP.black)
            }
            .frame(height: 60)
        }
    }
}

#Preview {
    FilterCell(
        isMultipleChoice: true,
        isSelected: false,
        title: "Title",
        action: {}
    )
}
