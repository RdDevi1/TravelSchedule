//
//  CarrierCell.swift
//  TravelSchedule
//
//  Created by Vitaly Anpilov on 14.04.2024.
//

import SwiftUI

struct CarrierCell: View {
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 24)
            .fill(Color.YP.lightGray)
            .frame(height: 104)
            .overlay {
                VStack(spacing: 4) {
                    HStack {
                        Image("brandIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(
                                width: 38,
                                height: 38
                            )
                            .padding(.trailing, 8)
                        VStack {
                            Text("РЖД")
                                .font(.system(size: 17))
                                .foregroundStyle(Color.YP.blackU)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                                .lineLimit(1)
                                .padding(.trailing, 4)
                            Text("С пересадкой в Костроме")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.YP.red)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                                .lineLimit(1)
                                .padding(.trailing, 4)
                            }
                        
                        
                        Text("14 сентября")
                            .font(.system(size: 12))
                            .foregroundStyle(Color.YP.blackU)
                            .frame(
                                maxWidth: 75,
                                alignment: .trailing
                            )
                    }
                    .padding(.leading, 14)
                    .padding(.trailing, 7)
                    .padding(.bottom, 18)
                    
                    HStack {
                        Text("22:30")
                            .font(.system(size: 17))
                            .foregroundStyle(Color.YP.blackU)
                        VStack {
                            Divider()
                        }
                        Text("20 часов")
                            .font(.system(size: 12))
                            .foregroundStyle(Color.YP.blackU)
                        VStack {
                            Divider()
                        }
                        Text("08:15")
                            .font(.system(size: 17))
                            .foregroundStyle(Color.YP.blackU)
                    }
                    .padding(.horizontal, 14)
                }
            }
    }
}

#Preview {
    CarrierCell()
}
