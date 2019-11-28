//  ImageHelper.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/27/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import Foundation

import UIKit

class ImageHelper {
    private init() {}
    static let shared = ImageHelper()
    func fetchImage(urlString: String,completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completionHandler(.failure(.notAnImage))
                    return
                }
                completionHandler(.success(image))
            }
        }
    }
}
