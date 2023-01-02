//
//  HomeView.swift
//  AuChulTV
//
//  Created by 이민경 on 2023/01/02.
//


import SwiftUI

struct HomeView: View {
    @State var target: NotebookItem = NotebookItems[0]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("상품 정보")
                .font(.title3)
            VStack {
                Text("\(target.NotebookTitles)")
                    .font(.title)
                HStack {
                    Spacer()
                    VStack {
                        Text("\(target.NotebookPrices)")
                            .font(.title2)
                        HStack {
                            Button {
                                print("구매하기")
                            } label: {
                                Text("구매하기")
                            }
                            Button {
                                print("장바구니")
                            } label: {
                                Text("장바구니")
                            }
                        }
                    }
                    Spacer()
                }
                ScrollView{
                    SectionScrollView(target: $target, title: "현재 가장 HOT한 노트북")
                    SectionScrollView(target: $target, title: "최신 노트북")
                        .focusSection()
                    SectionScrollView(target: $target, title: "동훈's Pick 노트북")
                }
            }
        }
        .padding(.leading,50)
    }
}

struct SectionScrollView: View{
    @Binding var target: NotebookItem
    var title: String = ""
    
    var body: some View{
        VStack(alignment: .leading) {
            Text("\(title)")
                .font(.title3)
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(NotebookItems) { item in
                        Button(action: {
                            
                        }) {
                            FocusableRectangle(target: $target, itemTarget: item)
                            
                        }.buttonStyle(CardButtonStyle())
                    }
                }.padding(40)
            }
        }
    }
}

struct FocusableRectangle: View {
    @Environment(\.isFocused) var isFocused: Bool
    @State var color = Color.blue
    @State var defaultWidth: Double = 600
    @State var defaultHeight: Double = 400
    @Binding var target: NotebookItem
    var itemTarget: NotebookItem
    
    var body: some View {
        Image("\(itemTarget.NotebookImages)")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width: defaultWidth, height: defaultHeight)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 5)
            .onChange(of: isFocused, perform: { value in
                if value {
                    target = itemTarget
                }
            })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
