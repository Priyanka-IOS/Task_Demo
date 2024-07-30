//
//  TestUtility.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 17/07/24.
//

import Foundation

class TestUtility {


    static func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
  }
}
