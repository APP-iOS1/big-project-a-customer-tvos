//
//  HomeView.swift
//  AuChulTV
//
//  Created by 이민경 on 2023/01/02.
//


import SwiftUI

struct HomeView: View {
    @State var target: ItemInfo = ItemInfo(itemUid: "", storeId: "", itemName: "", itemCategory: "", itemAmount: 0, itemAllOption: ItemOptions(itemOptions: ["":[""]]), itemImage: [""], price: 0)
    
    @State private var isVideoShowing: Bool = false
    @State private var isPurchaseShowing: Bool = false
    
    
    @StateObject var productStore: ProductStore = ProductStore()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("상품 정보")
                    .font(.title3)
                VStack {
                    Text("\(target.itemName)")
                        .font(.title)
                    HStack {
                        Spacer()
                        VStack {
                            Text("\(target.price)")
                                .font(.title2)
                            HStack {
                                
                                Button {
                                    isPurchaseShowing.toggle()
                                } label: {
                                    Text("구매하기")
                                }
                                
                                Button {
                                    print("장바구니")
                                } label: {
                                    Text("장바구니")
                                }
                                Button {
                                    print("영상보기")
                                    isVideoShowing.toggle()
                                } label: {
                                    Text("영상보기")
                                }
                                .sheet(isPresented: $isVideoShowing) {
                                    DetailView()
                                }
                                .sheet(isPresented: $isPurchaseShowing) {
                                    PurchaseView(target: $target)
                                }
                            }
                        }
                        Spacer()
                    }
                    
                    
                    ScrollView{
                        SectionScrollView(productStore: productStore, target: $target, title: "현재 가장 찌릿한 전자 제품")
                        //                        SectionScrollView(target: $target, title: "최신 노트북")
                        //                        SectionScrollView(target: $target, title: "동훈's Pick 노트북")
                        //SectionScrollView2(productStore: productStore, target: $target)
                    }
                }
            }
            .padding(.leading, 50)
            .onAppear{
                productStore.fetchPosts()
            }
        }
    }
}

struct SectionScrollView: View{
    
    @ObservedObject var productStore: ProductStore
    
    @Binding var target: ItemInfo
    var title: String
    
    
    var body: some View{
        VStack(alignment: .leading) {
            Text("\(title)")
            
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(productStore.products, id: \.itemUid) { product in
                        Button(action: {
                            
                        }) {
                            FocusableRectangle(target: $target, itemTarget: product)
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
    @State var defaultWidth: Double = 300
    @State var defaultHeight: Double = 200
    
    @Binding var target: ItemInfo
    var itemTarget: ItemInfo
    
    var body: some View {
        //
        //        Text("\(itemTarget.itemName)")
        //            .font(.title3)
        //
        if itemTarget.itemImage.first != "" {
            AsyncImage(url: URL(string: itemTarget.itemImage.first!)) { image in
                image
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: defaultWidth, height: defaultHeight)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 5)
            .onChange(of: isFocused, perform: { value in
                if value {
                    target = itemTarget
                }
            })
        } else {
            Image("zrs")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: defaultWidth, height: defaultHeight)
                .cornerRadius(10)
                .shadow(radius: 5)
                .onChange(of: isFocused, perform: { value in
                    if value {
                        target = itemTarget
                    }
                })
            
        }
        
        //        Image("\(itemTarget.itemImage.first!)")
        //            .resizable()
        //            .renderingMode(.original)
        //            .aspectRatio(contentMode: .fill)
        //            .frame(width: defaultWidth, height: defaultHeight)
        //            .clipped()
        //            .cornerRadius(10)
        //            .shadow(radius: 5)
        //            .onChange(of: isFocused, perform: { value in
        //                if value {
        //                    target = itemTarget
        //                }
        //            })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}





//struct SectionScrollView2: View{
//    @ObservedObject var productStore: ProductStore
//
//    @Binding var target: ItemInfo
//
//    var title: String = ""
//
//    var body: some View{
//        VStack(alignment: .leading) {
//            Text("\(title)")
//                .font(.title3)
//            ScrollView(.horizontal) {
//                HStack() {
//                    ForEach(productStore.products, id: \.itemUid) { item in
//                        Button(action: {
//
//                        }) {
//                            FocusableRectangle2(target: $target, itemTarget: item)
//
//                        }.buttonStyle(CardButtonStyle())
//                    }
//                }.padding(40)
//            }
//        }
//    }
//}
//
//struct FocusableRectangle2: View {
//    @Environment(\.isFocused) var isFocused: Bool
//    @State var color = Color.blue
//    @State var defaultWidth: Double = 300
//    @State var defaultHeight: Double = 200
//    @Binding var target: ItemInfo
//    var itemTarget: ItemInfo
//
//    var body: some View {
//
//        //        Image("\(itemTarget.itemName)")
//        //            .resizable()
//        //            .renderingMode(.original)
//        //            .aspectRatio(contentMode: .fill)
//        //            .frame(width: defaultWidth, height: defaultHeight)
//        //            .clipped()
//        //            .cornerRadius(10)
//        //            .shadow(radius: 5)
//        //            .onChange(of: isFocused, perform: { value in
//        //                if value {
//        //                    target = itemTarget
//        //                }
//        //            })
//        AsyncImage(url: URL(string: itemTarget.itemImage.first!)) { image in
//            image
//                .resizable()
//                .renderingMode(.original)
//                .aspectRatio(contentMode: .fill)
//        } placeholder: {
//            ProgressView()
//        }
//        .frame(width: defaultWidth, height: defaultHeight)
//        .clipped()
//        .cornerRadius(10)
//        .shadow(radius: 5)
//        .onChange(of: isFocused, perform: { value in
//            if value {
//                target = itemTarget
//            }
//        })
//    }
//}
