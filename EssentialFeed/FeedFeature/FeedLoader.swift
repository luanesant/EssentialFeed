//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Luane dos Santos Lopes on 07/11/22.
//

import Foundation
enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader{
    func load(completion: @escaping (LoadFeedResult) -> Void)
}


