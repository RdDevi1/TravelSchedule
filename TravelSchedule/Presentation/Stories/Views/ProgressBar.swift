//
//  ProgressBar.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.06.2024.
//

import SwiftUI

struct ProgressBar: View {
    
    // MARK: - Properties
    
    let numberOfSections: Int
    let progress: CGFloat

    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(
                    cornerRadius: 3
                )
                    .frame(
                        width: geometry.size.width,
                        height: 6
                    )
                    .foregroundColor(Color.YP.whiteU)

                RoundedRectangle(
                    cornerRadius: 3
                )
                    .frame(
                        width: min(
                            progress * geometry.size.width,
                            geometry.size.width
                        ),
                        height: 6
                    )
                    .foregroundColor(Color.YP.blue)
            }
            .mask {
                MaskView(numberOfSections: numberOfSections)
            }
        }
    }
}

// MARK: - Private structs

private struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

private struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(
            cornerRadius: 3
        )
        .frame(height: 6)
        .foregroundStyle(.white)
    }
}

// MARK: - Preview

#Preview {
    Color.YP.gray
        .ignoresSafeArea()
        .overlay(
            ProgressBar(
                numberOfSections: 5,
                progress: 0.5
            )
            .padding()
        )
}
