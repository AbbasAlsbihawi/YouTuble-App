//
//  Home.swift
//  YouTuble App
//
//  Created by Abbas on 27/06/2024.
//

import SwiftUI

struct Home: View {
    @State private var natureScrollOffset :CFloat = 0
    @State private var lastScrollOffset :CFloat = 0
    @State private var headerOffset :CFloat = 0
    @State private var isUpScrollUp :Bool = false
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let headerHeight = 0 + safeArea.top
            
            ScrollView(.vertical){
                LazyVStack(spacing: 15, content: {
                    ForEach(1...50, id: \.self) { count in
                        DummyCard()
                    }
                })
                .padding(15)
            }.safeAreaInset(edge: .top,spacing: 0) {
                HeaderView()
                    .padding(.bottom ,15)
                    .frame(height: headerHeight,alignment: .bottom)
                    .background(.background)
            }
            .onChange(of: isUpScrollUp) { oldValue , newValue in
                
                natureScrollOffset = natureScrollOffset - headerOffset
                
            }
        }
        
        
    }
    
    // HeaderView
    @ViewBuilder
    func  HeaderView() -> some View {
        HStack(spacing: 20,
               content: {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(height: 25)
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Button("",systemImage: "airplayvideo"){
                
            }
            Button("",systemImage: "bell"){
                
            }

            Button("",systemImage: "magnifyingglass"){
                
            }

        } )
        .font(.title2)
        .foregroundStyle(Color.primary )
        .padding(.horizontal, 15)
    }
    
    
    // Dummy Card View
    @ViewBuilder
    func DummyCard() -> some View {
        VStack(alignment: .leading ,  spacing: 6,   content: {
            RoundedRectangle(cornerRadius: 6)
                .frame(height: 200)
            HStack(spacing: 10, content: {
                Circle()
                    .frame(width:45,height:45)
                VStack(alignment: .leading,spacing: 4, content: {
                    Rectangle()
                        .frame(height: 10)
                    HStack(spacing: 10, content: {
                        Rectangle()
                            .frame(width: 100)
                        Rectangle()
                            .frame(width: 80)
                        Rectangle()
                            .frame(width: 60)
                    }).frame(height: 10)
                    
                })
            } )
            
        } ).foregroundStyle(.tertiary)
    }
}

#Preview {
    Home()
}
