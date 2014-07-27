//
//  SwiftDocParser.swift
//
//  Created by ToKoRo on 2014-07-27.
//

import Foundation

class SwiftDocParser {

    private var document: HTMLDocument?

    init(path: NSString) {
        var error: NSError?
        let htmlString = NSString.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: &error)
        self.document = HTMLDocument(string: htmlString)
    }

    func functions() -> [String] {
        let matches = document?.nodesMatchingSelector(".Swift .item .otp-indent")
        var results = [String]()
        if let elements = matches as? [AnyObject] {
            for element in elements {
                if let textContent = element.textContent {
                    if !textContent.isEmpty {
                        results += textContent
                    }
                }
            }
        }
        return results
    }

    func types() -> [String] {
        let matches = document?.nodesMatchingSelector("span.n a")
        var results = [String]()
        if let elements = matches as? [AnyObject] {
            for element in elements {
                if let textContent = element.textContent {
                    if !textContent.isEmpty {
                        results += textContent
                    }
                }
            }
        }
        return results
    }

    func subclasses() -> [String] {
        let matches = document?.nodesMatchingSelector(".subclass .code-voice a")
        var results = [String]()
        if let elements = matches as? [AnyObject] {
            for element in elements {
                if let textContent = element.textContent {
                    if !textContent.isEmpty {
                        results += textContent
                    }
                }
            }
        }
        return results
    }

    func enumValues() -> [String] {
        let matches = document?.nodesMatchingSelector(".constant .Swift .code-voice")
        var results = [String]()
        if let elements = matches as? [AnyObject] {
            for element in elements {
                if let textContent = element.textContent {
                    if !textContent.isEmpty {
                        results += textContent
                    }
                }
            }
        }
        return results
    }
    
}
