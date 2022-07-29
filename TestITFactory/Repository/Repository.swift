//
//  Repository.swift
//  TestITFactory
//
//  Created by Shaxzod Azamatjonov on 29/07/22.
//

import Alamofire

class Repository {
    static let shared = Repository()
    func getItems(compilation: @escaping(([HealthyFood])-> Void)) {
        AF.request(API.Urls.url).responseDecodable(of: [HealthyFood].self){ res in
            guard let data = res.value else {
                print("Error")
                return
            }
            compilation(data)
        }
    }
}
