//
//  ContentView.swift
//  YouTuble App
//
//  Created by Abbas on 25/06/2024.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
////        Home()
////            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//        
//        
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//struct ContentView: View {
//    @State private var position: Int?
//    
//    var body: some View {
//        ScrollView {
//            LazyVStack {
//                ForEach(0..<100) { index in
//                    Text(verbatim: index.formatted())
//                        .id(index)
//                }
//            }
//            .scrollTargetLayout()
//        }
//        .scrollPosition(id: $position)
//    }
//}


import SwiftUI

struct ContentView: View {
    @State private var offset: CGFloat = 0
    @State private var contentHeight: CGFloat = 0

    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            self.offset = geometry.frame(in: .named("scroll")).minY
                        }
                        .onChange(of: geometry.frame(in: .named("scroll")).minY) { oldValue, newValue in
                            self.offset = newValue
                            print("Scrolled to \(newValue)")
                        }
                        .onChange(of: geometry.size.height) { oldValue, newValue in
                            self.contentHeight = newValue
                            print("Content height changed to \(newValue)")
                        }
                }
                .frame(height: 0) // This GeometryReader only for tracking scroll position
                ForEach(0..<50) { index in
                    Text("Item \(index)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                }
            }
        }
        .coordinateSpace(name: "scroll")
        .overlay(
            VStack {
                Text("Scroll offset: \(offset)")
                Text("Content height: \(contentHeight)")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
            , alignment: .top
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
