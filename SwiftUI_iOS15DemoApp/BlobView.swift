//
//  BlobView.swift
//  SwiftUI_iOS15DemoApp
//
//  Created by nazimei on 2022/12/9.
//

import SwiftUI

struct BlobView: View {
    
    @State  var isAppeared = false
    
    let rect = CGRect(x: 0, y: 0, width: 400, height: 410)
    var body: some View {
        TimelineView (.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            
            let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 10)
            let x2 = cos(angle2.radians)
            
            //            Text("now \(now) angle \n \(angle.radians) \n x \(x)")
            Canvas { context, size in
                context.fill(myPath(in: rect, x, x2), with: .linearGradient(
                    Gradient.init(colors: [.blue.opacity(0.95), .blue.opacity(0.05)]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 400, y: 410)))
            }.frame(width: 400, height: 410)
                .rotationEffect(.degrees(isAppeared ? 360 : 0))
        }
        .onAppear {
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: true)) {
                isAppeared = true
            }
        }
    }
    
    func myPath(in rect: CGRect,_ x1: Double,_ x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width * 0.9
        let height = rect.size.height * 0.9
        path.move(to: CGPoint(x: 0.9923*width, y: 0.42593*height))
        path.addCurve(to: CGPoint(x: 0.6355*width*x2, y: height), control1: CGPoint(x: 0.92554*width*x2, y: 0.77749*height*x2), control2: CGPoint(x: 0.91864*width*x2, y: height))
        path.addCurve(to: CGPoint(x: 0.08995*width, y: 0.60171*height), control1: CGPoint(x: 0.35237*width*x1, y: height), control2: CGPoint(x: 0.2695*width, y: 0.77304*height))
        path.addCurve(to: CGPoint(x: 0.34086*width, y: 0.06324*height*x1), control1: CGPoint(x: -0.0896*width, y: 0.43038*height), control2: CGPoint(x: 0.00248*width, y: 0.23012*height*x1))
        path.addCurve(to: CGPoint(x: 0.9923*width, y: 0.42593*height), control1: CGPoint(x: 0.67924*width, y: -0.10364*height*x1), control2: CGPoint(x: 1.05906*width, y: 0.07436*height*x2))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        BlobView()
    }
}
