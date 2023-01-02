//
//  ContentView.swift
//  AuChulTV
//
//  Created by tae on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    @State var target: NotebookItem = NotebookItems[0]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Section 1")
            
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
            
            VStack(alignment: .leading) {
                
                // MARK: -View : 가로 스크롤 코드
                Text("가로 스크롤")
                    .font(.title3)
                    .bold()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(1...20, id: \.self) { num in
                            Text(String(num))
                                .frame(width : 80, height: 80)
                                .background(Color.yellow)
                                .cornerRadius(15)
                        }
                    }
                    
                }
                
                Divider()
                    .padding(.vertical, 20)
                
                // MARK: -View : 페이지네이션 코드
                Text("페이지네이션")
                    .font(.title3)
                    .bold()
                TabView {
                    ForEach(1...20, id: \.self) { num in
                        Text(String(num))
                            .frame(width : 80, height: 80)
                            .background(Color.yellow)
                            .cornerRadius(15)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(.page)
            }
            
            Text("Detail")
            
            VStack {
                Text("Detail Name")
                HStack {
                    Spacer()
                    VStack {
                        Text("\(target.NotebookTitles)")
                        Text("\(target.NotebookPrices)")
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
                    //
                    //                    Image("\(target.NotebookImages)")
                    //                        .resizable()
                    //                        .renderingMode(.original)
                    //                        .aspectRatio(contentMode: .fill)
                    //                        .frame(width: 300, height: 200)
                    Spacer()
                }
            }
            
        }
    }
}

struct FocusableRectangle: View {
    @Environment(\.isFocused) var isFocused: Bool
    @State var color = Color.blue
    @State var defaultWidth: Double = 300
    @State var defaultHeight: Double = 200
    @Binding var target: NotebookItem
    var itemTarget: NotebookItem
    
    var body: some View {
        //        ZStack {
        //            Rectangle()
        //                .fill(color)
        //                .frame(width: 300.0, height: 200.0)
        //                .onChange(of: isFocused, perform: { value in
        //                    if value {
        //                        target = itemTarget
        //                    }
        //                    color = value ? Color.red : Color.blue
        //                })
        //            Text("\(itemTarget.NotebookTitles)")
        //        }
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
                    defaultWidth = 600
                    defaultHeight = 400
                } else {
                    defaultWidth = 300
                    defaultHeight = 200
                }
                color = value ? Color.red : Color.blue
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
