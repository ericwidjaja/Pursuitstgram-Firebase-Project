//  AppError.swift
//  Pursuitstgram-Firebase-Project
//  Created by Eric Widjaja on 11/27/19.
//  Copyright © 2019 Eric.W. All rights reserved.

import Foundation

enum AppError: Error {
    case unauthenticated
    case invalidJSONResponse
    case couldNotParseJSON(rawError: Error)
    case noInternetConnection
    case badURL
    case badStatusCode
    case noDataReceived
    case notAnImage
    case other(rawError: Error)
    case couldNotEncode
}
