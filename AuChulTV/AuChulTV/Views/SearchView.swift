//
//  SearchView.swift
//  AuChulTV
//
//  Created by 이민경 on 2023/01/02.
//

import SwiftUI

struct SearchView: View {
    @State var target: NotebookItem = NotebookItems[0]
    @State var search: String = "Search"
    var body: some View {
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
        .searchable(text: $search)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
