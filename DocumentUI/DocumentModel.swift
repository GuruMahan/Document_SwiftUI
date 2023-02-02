//
//  DocumentModel.swift
//  DocumentUI
//
//  Created by Guru Mahan on 09/01/23.
//

import Foundation

struct DocumentModel: Identifiable {
    var id = UUID().uuidString
    let title: String
    let subtile: String
    var url: String = ""
    var pathExtension = ""

}
