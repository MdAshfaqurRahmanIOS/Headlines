//
//  JSONData.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 17/11/20.
//

import Foundation
struct JSONData: Codable {
    let status: String?
    let articles: [Articles]
//    let name: String?
}

struct Articles: Codable {
//    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
//struct Source: Codable {
//    let id: String
//    let name: String
//}
