//
//  NotebookItem.swift
//  AuChulTV
//
//  Created by tae on 2023/01/02.
//
// Prototype

import Foundation


struct NotebookItem: Identifiable{
    let id = UUID()
    let NotebookTitles: String
    let NotebookImages: String
    let NotebookPrices: String
}

var NotebookItems = [
    NotebookItem(NotebookTitles: "MacBookPro 14", NotebookImages: "Notebook", NotebookPrices: "₩2,690,000"),
    NotebookItem(NotebookTitles: "MacBookPro 13", NotebookImages: "Notebook", NotebookPrices: "₩2,490,000"),
    NotebookItem(NotebookTitles: "MacBookPro 16", NotebookImages: "Notebook", NotebookPrices: "₩3,090,000"),
    NotebookItem(NotebookTitles: "MacBookAir 13", NotebookImages: "Notebook", NotebookPrices: "₩1,690,000"),
    NotebookItem(NotebookTitles: "MacBookAir 13", NotebookImages: "Notebook", NotebookPrices: "₩1,690,000"),
    NotebookItem(NotebookTitles: "MacBookPro 14", NotebookImages: "Notebook", NotebookPrices: "₩2,690,000"),
    NotebookItem(NotebookTitles: "MacBookPro 16", NotebookImages: "Notebook", NotebookPrices: "₩3,790,000"),
    NotebookItem(NotebookTitles: "MacBookPro 16", NotebookImages: "Notebook", NotebookPrices: "₩3,090,000"),
]
