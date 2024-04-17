//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI

struct StoryView: View {
    
    // MARK: - Properties
    
    private let width: Double = 92
    private let height: Double = 140
    private let widthText: Double = 76
    private let heightText: Double = 45
    let story: Story
    let isNew: Bool
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Image(story.images.first ?? "")
                .resizable()
                .frame(
                    width: isNew ? width - 4 : width,
                    height: height
                )
                .opacity(isNew ? 1 : 0.5)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            Color.YP.blue,
                            lineWidth: isNew ? 4 : 0
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

#Preview {
    ZStack {
        Color.YP.whiteU
        StoryView(
            story: Story(
                images: ["2", "21", "22"],
                title: "Test Test Test Test Test ",
                subTitle: "Test Test Test Test Test Test Test Test"
            ),
            isNew: false
        )
    }
}
