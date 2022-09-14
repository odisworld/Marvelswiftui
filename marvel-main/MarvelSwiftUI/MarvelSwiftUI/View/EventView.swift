//
//  EventView.swift
//  MarvelSwiftUI
//
//  Created by Consultant on 22/08/2022.
//

import SwiftUI

struct EventView: View {
    var events: [ComicsItemPresentation]
    
    init (items: [ComicsItemPresentation]) {
        events = items
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Events")
                    .font(.title)
                    .padding(.leading)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.events, id:\.name) { item in
                        VStack {
                                    Text("\(item.name)").foregroundColor(Color.white)
                        
                                        .frame(width: 120, height: 80)
                                        .padding(.all)
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                        .multilineTextAlignment(.center)
                                        
                                }.background(Color.black)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2))
                    }
                }
            }.padding(.bottom)
        }
    }
}
