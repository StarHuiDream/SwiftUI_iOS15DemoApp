//
//  MatchedView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/12.
//

import SwiftUI

struct MatchedView: View {
    
    @Namespace var matchedViewNameSpace
    @State var isShowed = true
    
    
    
    var body: some View {
        ZStack {
            if !isShowed {
                
            } else {
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
