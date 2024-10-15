//
//  ImportModel.swift
//  Books
//
//  Created by Marcin Jędrzejak on 15/10/2024.
//

import Foundation

struct ImportModel: Codable {
    struct GenreI: Codable {
        let name: String
        let color: String
    }
    
    struct AuthorI: Codable {
        let firstName: String
        let lastName: String
        let authorId: String
    }
    
    struct BookI: Codable {
        let name: String
        let genre: String
        let authorIds: [String]
    }
    
    let genres: [GenreI]
    let authors: [AuthorI]
    let books: [BookI]
}
