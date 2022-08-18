//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by boyaa on 2022/8/17.
//

import SwiftUI
import UIKit
import Foundation

struct GroupModel{
    var manName: String
    var womanName: String
}

let model = [
    GroupModel(manName: "云天明", womanName: "程心"),
    GroupModel(manName: "罗辑", womanName: "庄颜")
]

struct RowContent: View {
    var groupModel: GroupModel
    var body: some View{
        HStack{
            Image("Heart_red")
                .resizable()
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 10, content: {
                Text(self.groupModel.manName).bold().font(Font.system(size: 20))
                Text(self.groupModel.womanName).font(Font.system(size: 15))
            })
            Spacer()
        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20))
    }
}

struct ContentImage: View {
    var manName: String
    var womanName: String
    var body: some View {
        VStack() {
            Text(manName).offset(x: 0, y: -90)
            Image("Heart_red")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 30)
                .offset(x: 0, y: -70)
            Text(womanName).offset(x: 0, y: -30)
        }
    }

}

struct ContentView: View {
    
    var body: some View {
       VStack(alignment: .leading, spacing: 5, content: {

//
//            Text("Hello, SwiftUI.")
//                .foregroundColor(.purple)
//                .font(Font.system(size: 25))
//
//            ImageView()
//            Label()
            //RowContent()
//            List{
//                RowContent(groupModel: model[0])
//                RowContent(groupModel: model[1])
//            }
//            NavigationView {
//                List(model, id: \.manName) { mod in
//                    NavigationLink(destination: ContentImage(manName: mod.manName, womanName: mod.womanName))
//                    {
//                        RowContent(groupModel: mod)
//
//                    }
//
//                }
//                .navigationBarTitle("通讯录", displayMode: .inline)
//            }
//            Button(action: {
//                 self.count += 1
//             }, label: {
//                Text("按钮").font(Font.system(size: 25))
//             })
//            Text("\(self.count)")
        
//           SubTextView()
//        ZStack{
//            ForEach(0 ..< 10){ i in
//                DrawView(angle: Angle(degrees: Double(36 * i))).opacity(0.2)
//            }
//        }
        DrawView2()
         
        

        })
    }
}


struct SubTextView: View {
    @EnvironmentObject var data: EnviData
    var body: some View {
        Button(action: {
            data.count += 1
        }, label: {
            Text("按钮")
        })
        Text("\(data.count)")
        
    }
    
}


struct ImageView: View {
    var body: some View {
        Image("Heart_red")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment:.center)
            .clipShape(Circle())
    }
}

struct Label: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UILabel {
       return UILabel(frame: CGRect(x: 10, y: 30, width: 60, height: 20))
    }
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = "ceshi"
        uiView.textAlignment = .left
    }

}

struct DrawView: View{
    var angle: Angle
    var body: some View {
//        Path({ path in
//            let width = 100
//            let height = 100
//            path.move(to: CGPoint(x: width, y: height))
//            path.addLine(to: CGPoint(x: 180, y: 300 ))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: width, y: height))
//            path.addRect(CGRect(x: 100, y: 200, width: 200, height: 300))
//            path.addEllipse(in: CGRect(x: 10, y: 230, width: 100, height: 100))
//            path.addCurve(to: CGPoint(x: 100, y: 520), control1: CGPoint(x: 180, y: 400), control2: CGPoint(x: 270, y: 600))
//            path.addRoundedRect(in: CGRect(x: 100, y: 400, width: 200, height: 100), cornerSize: CGSize(width: 300, height: 100))
//
//        }).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 3)
        Path({ path in
            let width = 200
            let height = 0
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 100, y: 200 ))
            path.addLine(to: CGPoint(x: 200, y: 400))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 200, y: 0))
         
        }).stroke(style: StrokeStyle(lineWidth: 3, lineCap: .butt, lineJoin: .bevel, miterLimit: 2, dash: [5,4], dashPhase: 2)).foregroundColor(.purple)
        Path({ path in
            let width = 200
            let height = 20
            path.move(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 100, y: 220 ))
            path.addLine(to: CGPoint(x: 200, y: 420))
            path.addLine(to: CGPoint(x: 300, y: 220))
         
        }).fill(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .leading, endPoint: .trailing)).rotationEffect(angle, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

extension Animation {
    static func customAnimation() -> Animation {
        Animation.spring(response: 4, dampingFraction: 3, blendDuration: 2)
            .speed(2).delay(3)
    }
}

struct DrawView2: View{
    @State private var begin = false
    var body: some View {
        VStack(alignment: .center, content: {
            Button(action: {
                withAnimation {
                    self.begin.toggle()
                }
               
            }, label: {
                Text("开始").font(Font.system(size: 20))
                    .rotationEffect(.degrees(self.begin ? 180 : 0))
                    .scaleEffect(self.begin ? 2 : 1)
                    .animation(.easeInOut(duration: 2))
            })
        })
        if self.begin {
            ZStack{
                ForEach(0 ..< 10){ i in
                    DrawView(angle: Angle(degrees: Double(36 * i))).opacity(0.2)
                        .animation(.customAnimation())
                        .transition(.scale)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

//        Group{
//            RowContent(groupModel: model[0])
//            RowContent(groupModel: model[1])
//        }.previewLayout(.fixed(width: 400, height: 80))
        ContentView().environmentObject(EnviData())
    


    }
}
