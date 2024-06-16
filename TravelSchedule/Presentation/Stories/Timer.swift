//
//  Timer.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.06.2024.
//

import Foundation

struct TimerConfiguration {
    
    // MARK: - Properties
    
    let timerTickInternal: TimeInterval
    let progressPerTick: CGFloat
    
    // MARK: - Init
    
    init(
        storiesCount: Int,
        secondsPerStory: TimeInterval = 5,
        timerTickInternal: TimeInterval = 0.25
    ) {
        self.timerTickInternal = timerTickInternal
        self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInternal
    }
}
