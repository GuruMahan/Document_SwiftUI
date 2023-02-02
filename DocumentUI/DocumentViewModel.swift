//
//  DocumentViewModel.swift
//  DocumentUI
//
//  Created by Guru Mahan on 09/01/23.
//

import Foundation

class DocumentViewModel: ObservableObject{
    @Published var documentModel = [DocumentModel]()
    init() {
        let item1 = DocumentModel(title: "ID Proof", subtile: "id")
        documentModel.append(item1)
        let item2 = DocumentModel(title: "Address Details", subtile: "id")
        documentModel.append(item2)
    }
}
