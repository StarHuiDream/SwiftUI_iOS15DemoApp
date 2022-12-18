//
//  AvatarView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/18.
//

import SwiftUI

struct AvatarView: View {
    var body: some View {
        
        AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
            case .empty:
                ProgressView()
            case .failure(_):
                Color.secondary
            default:
                EmptyView()
            }
        }
        .frame(width: 28, height: 28)
        .cornerRadius(14)
        .padding(8)
        .foregroundColor(.secondary)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .strokeStyle(cornerRadius: 14)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
