//
//  InfoCellAboutCarrier.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

struct InfoCellAboutCarrier: View {
    
    // MARK: - Properties
    
    let title: String
    let subTitle: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(.system(size: 17))
                    .foregroundStyle(Color.YP.black)
                    .frame(
                        width: UIScreen.main.bounds.width - 60,
                        alignment: .leading
                    )
                Text(subTitle)
                    .font(.system(size: 12))
                    .foregroundStyle(Color.YP.blue)
                    .frame(
                        width: UIScreen.main.bounds.width - 60,
                        alignment: .leading
                    )
            }
            Image(systemName: "checkmark.square.fill")
                .foregroundStyle(Color.YP.black)
        }
    }
}

// MARK: Preview

#Preview {
    InfoCellAboutCarrier(
        title: "title",
        subTitle: "subTitle")
}

