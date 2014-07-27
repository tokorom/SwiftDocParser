//
//  main.swift
//
//  Created by ToKoRo on 2014-07-27.
//

import Foundation

let docsetPath = "/Users/ytokoro/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS8.0.iOSLibrary.docset"
let documentationDirectory = "Contents/Resources/Documents/documentation"
let documentationPath = docsetPath.stringByAppendingPathComponent(documentationDirectory)

let fileManager = NSFileManager()
var sets = NSMutableSet()

let enumerator = fileManager.enumeratorAtPath(documentationPath)
var filePath: String? = enumerator.nextObject() as? NSString
while nil != filePath {
    if filePath!.hasSuffix("index.html") {
        let path = documentationPath.stringByAppendingPathComponent(filePath!)
        let docParser = SwiftDocParser(path: path)

        let types = docParser.types()
        for keyword in types {
            if !sets.containsObject(keyword) {
                sets.addObject(keyword)
                println(keyword);
            }
        }
        let enumValues = docParser.enumValues()
        for keyword in enumValues {
            if !sets.containsObject(keyword) {
                sets.addObject(keyword)
                println(keyword);
            }
        }
        let functions = docParser.functions()
        for keyword in functions {
            if !sets.containsObject(keyword) {
                sets.addObject(keyword)
                println(keyword);
            }
        }
    }
    filePath = enumerator.nextObject() as? NSString
}
