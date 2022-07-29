//
//  Repository.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import Alamofire

class Repository {
    static let shared = Repository()
    func getItems(compilation: @escaping(([Title])-> Void)) {
        let url = AppUrl()
        AF.request(url.baseUrl).responseDecodable(of: [Title].self){ res in
            guard let data = res.value else {
                print("Error")
                return
            }
            compilation(data)
        }
    }
}
