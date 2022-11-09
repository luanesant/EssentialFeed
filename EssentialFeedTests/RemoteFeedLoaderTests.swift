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


class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL(){
        let (_, client) = makeSUT()

                
        XCTAssertNil(client.requestedURL)
    }

    
    func test_load_requestDataFromURL(){
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
                
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, cliente: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    // Por que criar uma classe spy e mover a variavel e seu metodo para ela?

    private class HTTPClientSpy: HTTPClient{
        var requestedURL: URL?
        
        func get(from url: URL){
            requestedURL = url
        }
    }

}
