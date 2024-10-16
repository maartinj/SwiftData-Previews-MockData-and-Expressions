//
//  BookListView.swift
//  Books
//
//  Created by Marcin Jędrzejak on 16/10/2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    @Query var books: [Book]
    @State private var selectedBook: Book?
    
    init(sortOrder: SortOrder) {
        let sortDescriptors: [SortDescriptor<Book>] =
        switch sortOrder {
            case .book:
                [SortDescriptor(\Book.name)]
            case .genre:
                [SortDescriptor(\Book.genre.name)]
        }
        _books = Query(sort: sortDescriptors)
    }
    
    var body: some View {
        List(books) { book in
            VStack(alignment: .leading) {
                HStack {
                    Text(book.name)
                        .font(.title)
                    Spacer()
                    Text(book.genre.name)
                        .tagStyle(genre: book.genre)
                }
                HStack {
                    Text(book.allAuthors)
                    Spacer()
                    Button {
                        selectedBook = book
                    } label: {
                        Image(systemName: "message")
                            .symbolVariant(book.comment.isEmpty ? .none : .fill)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .listStyle(.plain)
        .sheet(item: $selectedBook) { book in
            BookCommentView(book: book)
                .presentationDetents([.height(300)])
        }
    }
}

#Preview(traits: .mockData) {
    let sortOrder = SortOrder.book
    BookListView(sortOrder: sortOrder)
}
