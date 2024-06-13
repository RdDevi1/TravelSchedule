//
//  CheckBoxView.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 13.04.2024.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var isAccepted: Bool
    
    var body: some View {
        VStack {
            Toggle(isOn: $isAccepted) {
                Text("Checkbox")
            }
            .toggleStyle(CheckboxToggleStyle())
            .foregroundColor(.black)
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        .resizable()
        .frame(width: UIConstants.CheckBox.height, height: UIConstants.CheckBox.height)
        .onTapGesture { configuration.isOn.toggle() }
        
    }
  }
}
