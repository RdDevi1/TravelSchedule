//
//  GridCellView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 16.06.2024.
//

import SwiftUI

struct GridCellView: View {
    
    // MARK: - Properties
    
    private let width: Double = 92
    private let height: Double = 140
    private let widthText: Double = 76
    private let heightText: Double = 45
    let story: Story
    let isItShown: Bool
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Image(story.image)
                .resizable()
                .scaledToFill()
                .frame(
                    width: isItShown ? width : width - 4 ,
                    height: height
                )
                .opacity(isItShown ? 0.5 : 1)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            Color.YP.blue,
                            lineWidth: isItShown ? 0 : 4
                        )
                )
            VStack {
                Text(story.title)
                    .frame(
                        width: widthText,
                        height: heightText
                    )
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .font(.system(size: 12))
                    .foregroundStyle(
                        Color.YP.whiteU
                    )
                    .padding(.bottom, 12)
                    .padding(.top, 83)
            }
        }
    }
}

    // MARK: - Preview

#Preview {
    ZStack {
        Color.YP.whiteU
        GridCellView(
            story: Story(
                image: "2",
                title: "Test Test Test Test Test ",
                subTitle: "Test Test Test Test Test Test Test Test"
            ),
            isItShown: false
        )
    }
}
