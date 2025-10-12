//
//  PullEffectScrollerView.swift
//  SwiftUIDemo_03
//
//  Created by Boyang on 2025/10/12.
//

import SwiftUI

struct PullEffectScrollerView<Content: View>: View {
    var dragDistance : CGFloat = 100
    var actionTopPadding:CGFloat = 0
    var leadingAction:PullEffectAction
    var centerAction:PullEffectAction
    var trailingAction:PullEffectAction

    @ViewBuilder var content:Content

    @State private var effectProgress:CGFloat = 0
    @GestureState private var isGestureActive: Bool = false
    @State private var scrollOffset : CGFloat = 0
    @State private var initialScrollOffset:CGFloat = 0
    
    
    var body: some View {
        ScrollView(.vertical){
            content
        }
        .onScrollGeometryChange(for: CGFloat.self, of: { $0.contentOffset.y + $0.contentInsets.top }, action: { oldValue, newValue in
            scrollOffset = newValue
        })
        
        .onChange(of: isGestureActive, { oldValue, newValue in
            initialScrollOffset = newValue ? scrollOffset.rounded(): 0
            
        })
        
        
        
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .updating($isGestureActive, body: { _, out, _ in
                    out = true
                })
                .onChanged({ value in
                    guard initialScrollOffset == 0 else {
                        return
                    }
                    let translationY = value.translation.height
                    let progress = min((max(translationY / dragDistance,0)), 1)
                    effectProgress = progress
                    
                })
                .onEnded({value in
                    
                })
            
            
        )
        
        
        .overlay(alignment: .top){
             ActionView()
                .padding(.top,actionTopPadding)
                .ignoresSafeArea()
        }

    }
    // action view
    
    @ViewBuilder
    private func ActionView() -> some View {
        HStack(spacing: 0) {
            
            let delayedProgress = (effectProgress - 0.7) / 0.3
            
            
            ActionButton(.leading)
                .opacity(delayedProgress)
            
            ActionButton(.center)
                .opacity(effectProgress)
            
            ActionButton(.trailing)
                .opacity(delayedProgress)

            
        }
        .padding(.horizontal,20)
    }
    // action button
    @ViewBuilder
    
    private func ActionButton(_ position: ActionPosition) -> some View{
        let action = position == .center ? centerAction: position == .trailing ? trailingAction:leadingAction
        
        Image(systemName: action.symbol)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 60,height: 60)
            .background{
                ZStack{
                    Rectangle()
                        .fill(.background)
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                }
                .clipShape(.rect(cornerRadius: 30))
                .compositingGroup()
                
            }
            .frame(maxWidth:.infinity)
        
    }
    
    private enum ActionPosition:Int{
        case leading = -1
        case center = 0
        case trailing = 1
    }
    
    
    
    
    
}






struct PullEffectAction {
    var symbol: String
    //more P
    var action: ()->()
    
    
}



#Preview {
    ContentView()
}
