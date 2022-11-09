//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Luane dos Santos Lopes on 08/11/22.
//

import XCTest


class RemoteFeedLoader{
    let client: HTTPClient
    let url: URL
    init(url: URL = URL(string: "https://a-url.com")!, client: HTTPClient){
        self.client = client
        self.url = url
    }
    
    func load(){
        client.get(from: url)
    }
}


protocol HTTPClient{
    func get(from url: URL)
}

// Por que criar uma classe spy e mover a variavel e seu metodo para ela?

class HTTPClientSpy: HTTPClient{
    var requestedURL: URL?
    
    func get(from url: URL){
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
                
        XCTAssertNil(client.requestedURL)
    }

    
    func test_load_requestDataFromURL(){
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
                
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
}
