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
        Text("Helloworld")
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
