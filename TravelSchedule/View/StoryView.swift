//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 07.04.2024.
//

import SwiftUI

struct Story: Identifiable {
    var id = UUID()
    var text: String
    var image: String
}


struct StoryView: View {
    
    var story: Story
    
    let imageHeight: Double = 80
    
    var body: some View {
        VStack {
            Image(story.image)
                .resizable()
                .scaledToFit()
                .frame(width: imageHeight, height: imageHeight)
                .cornerRadius(imageHeight/2)
            
            Text(story.text)
                .font(.system(size: 20, weight: .semibold))
                .multilineTextAlignment(.center)
            Spacer()

        }
        .padding()
        .frame(maxWidth: 140, maxHeight: 220)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
   
}

#Preview {
    StoryView(story: Story(text: "1 story", image: "text.below.photo"))
}
