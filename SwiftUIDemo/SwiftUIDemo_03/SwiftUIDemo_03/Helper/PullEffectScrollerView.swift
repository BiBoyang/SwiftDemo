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

    var body: some View {
        ScrollView(.vertical){
            content
        }
        .overlay(alignment: .top){
             
        }

    }
    // action view
    
    @ViewBuilder
    private func ActionView() -> some View {
        HStack(spacing: 0) {
            ActionButton(.leading)
            ActionButton(.center)
            ActionButton(.trailing)

            
        }
    }
    // action button
    @ViewBuilder
    
    private func ActionButton(_position: ActionPosition) -> some View{
        
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
