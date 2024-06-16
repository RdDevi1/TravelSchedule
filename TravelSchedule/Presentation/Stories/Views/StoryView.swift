//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.06.2024.
//

import SwiftUI

import SwiftUI

struct StoryView: View {
    
    // MARK: - Properties
    
    let story: Story

    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            background
            
            VStack(spacing: 16) {
                Spacer()
                Text(story.title)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(Color.YP.whiteU)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .lineLimit(3)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                
                Text(story.subTitle)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.YP.whiteU)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .lineLimit(3)
                    .padding(.bottom, 57)
                    .padding(.horizontal, 16)
            }
        }
        .background(Color.YP.blackU)
        .ignoresSafeArea()
        }
    }

// MARK: Extension StoryView

extension StoryView {
 
    private var background: some View {
        Color.clear
            .overlay {
                Image(story.image)
                    .resizable()
                    .scaledToFill()
                   
            }
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .padding(.top, 50)
            .padding(.bottom, 17)
    }
}

// MARK: - Preview

#Preview {
    StoryView(
        story: Story(
            image: "1",
            title: "Test Test Test Test Test Test Test Test Test Test Test Test Test Test",
            subTitle: "Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test Test"
        )
    )
}
