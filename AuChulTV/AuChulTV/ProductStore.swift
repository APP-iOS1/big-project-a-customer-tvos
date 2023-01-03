//
//  TmpStore.swift
//  AuChulTV
//
//  Created by tae on 2023/01/03.
//

import Foundation
import FirebaseFirestore

class ProductStore: ObservableObject {
    
    @Published var products:[ItemInfo] = []
    
    let database = Firestore.firestore()
    
    //MARK: Posts
    
    
    
    func fetchPosts() {
        
        database.collection("StoreInfo").document("tvOS-0001").collection("item")
            .getDocuments { (snapshot, error) in
                // 값이 중복되는 경우에 대비
                self.products.removeAll()
                if let snapshot {
                    for document in snapshot.documents {
                        
                        let docData = document.data()
                        
                        let id: String = document.documentID
                        let itemName: String = docData["ItemData"] as? String ?? "Mac"
                        let itemCategory: String = docData["itemCategory"] as? String ?? "NoteBook"
                        let itemAmount: String = docData["itemAmount"] as? String ?? "0"
                        let itemImage: String = docData["itemImage"] as? String ?? ""
                        let price: String = docData["itemImage"] as? String ?? "NoteBook"
                        
                        
                        let product: ItemInfo = ItemInfo(itemUid: id, storeId: "", itemName: itemName, itemCategory: itemCategory, itemAmount: Int(itemAmount) ?? 0, itemAllOption: ItemOptions(itemOptions: ["":[""]]), itemImage: [itemImage], price: Double(price) ?? 0)
                        
                        self.products.append(product)
                        
                        
                    }
                    
                }
                print(self.products)
                
                
                
            }
        
    }
    
    
}



//
//var idArray: [String] = []
//
////let docData = document.data()
//let id = docData["id"] as? String ?? "No Id?"
//idArray.append(id)
//print(idArray)




//                        print("TEST \(self.database.collection("StoreInfo").document("\(id)").collection("Item").document("itemName"))")
//
//

//                        let item: ItemInfo = docData["Item"] as? ItemInfo ?? ItemInfo(itemUid: "", storeId: "", itemName: "None", itemCategory: "", itemAmount: 1, itemAllOption: ItemOptions(itemOptions: ["":[""]]), itemImage: [""], price: 0)

//print(id)
//                        print("None: \(item.itemName)")
//
//                        self.products.append(product)

//
//func fetchPosts() {
//
//    database.collection("StoreInfo")
//        .getDocuments { (snapshot, error) in
//            // 값이 중복되는 경우에 대비
//            self.products.removeAll()
//
//            if let snapshot {
//                for document in snapshot.documents {
//
//                    let docData = document.data()
//
//                    let id: String = document.documentID
//                    let itemName: String = docData["ItemData"] as? String ?? "Mac"
//                    let itemCategory: String = docData["itemCategory"] as? String ?? "NoteBook"
//                    let itemAmount: String = docData["itemAmount"] as? String ?? "0"
//                    let itemImage: String = docData["itemImage"] as? String ?? ""
//                    let price: String = docData["itemImage"] as? String ?? "NoteBook"
//
//
//                    let product: ItemInfo = ItemInfo(itemUid: id, storeId: "", itemName: itemName, itemCategory: itemCategory, itemAmount: Int(itemAmount) ?? 0, itemAllOption: ItemOptions(itemOptions: ["":[""]]), itemImage: [itemImage], price: Double(price) ?? 0)
//
//                    self.products.append(product)
//
//
//                }
//
//            }
//            print(self.products)
//        }
//}
//
//
//func fetchPosts() {
//
//    database.collection("StoreInfo")
//        .getDocuments { (snapshot, error) in
//            // 값이 중복되는 경우에 대비
//            self.products.removeAll()
//
//            if let snapshot {
//                for document in snapshot.documents {
//
//
//                    let id: String = document.documentID
//
//                    self.database.collection("StoreInfo").document(id).collection("Item").getDocuments { (snapshot, error) in
//                        if let snapshot {
//                            for document in snapshot.documents {
//
//                                let docData = document.data()
//
//                                let id: String = document.documentID
//                                let itemName: String = docData["ItemData"] as? String ?? "Mac"
//                                let itemCategory: String = docData["itemCategory"] as? String ?? "NoteBook"
//                                let itemAmount: String = docData["itemAmount"] as? String ?? "0"
//                                let itemImage: String = docData["itemImage"] as? String ?? ""
//                                let price: String = docData["itemImage"] as? String ?? "NoteBook"
//
//
//                                let product: ItemInfo = ItemInfo(itemUid: id, storeId: "", itemName: itemName, itemCategory: itemCategory, itemAmount: Int(itemAmount) ?? 0, itemAllOption: ItemOptions(itemOptions: ["":[""]]), itemImage: [itemImage], price: Double(price) ?? 0)
//
//                                self.products.append(product)
//
//
//                            }
//
//                        }
//                        print(self.products)
//
//
//                    }
//
//
//
//
//                }
//
//            }
//        }
//}
