//
//  WebService.swift
//  News
//
//  Created by Berkay Ozcan on 12/09/2022.
//

import Foundation

class webService {
    func newsDown(url : URL, completion : @escaping ([News]?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let Error = error {
                print(Error.localizedDescription)
                completion(nil)
            }else if let Data = data {
                let haberDizisi = try? JSONDecoder().decode([News].self, from: Data)
                if let haberdizisi = haberDizisi{
                    completion(haberdizisi)
                }
            }
        }.resume()
    }
}

