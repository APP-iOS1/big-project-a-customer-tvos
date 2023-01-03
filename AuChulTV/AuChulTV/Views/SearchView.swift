//
//  SearchView.swift
//  AuChulTV
//
//  Created by 이민경 on 2023/01/02.
//

import SwiftUI

struct SearchView: View {
    @State var target: ItemInfo = ItemInfo(itemUid: "", storeId: "", itemName: "", itemCategory: "", itemAmount: 0, itemAllOption: ItemOptions(itemOptions: ["":[""]]), itemImage: [""], price: 0)
    @State var search: String = "Search"
    
    
    @StateObject var productStore: ProductStore = ProductStore()
    
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(productStore.products, id: \.itemUid) { item in
                    Button(action: {
                        
                    }) {
                        FocusableRectangle(target: $target, itemTarget: item)
                            
                    }.buttonStyle(CardButtonStyle())
                }
            }.padding(40)
        }
        .searchable(text: $search)
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
