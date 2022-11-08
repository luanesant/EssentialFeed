//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Luane dos Santos Lopes on 08/11/22.
//

import XCTest


class RemoteFeedLoader{
    
}


class HTTPClient{
    var requestedURL: URL?
}
class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        let client = HTTPClient()
        let sut = RemoteFeedLoader()
                
        XCTAssert(client.requestedURL)
    }

}
