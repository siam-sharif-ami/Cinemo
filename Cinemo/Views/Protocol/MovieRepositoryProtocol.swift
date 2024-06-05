//
//  MovieRepositoryProtocol.swift
//  Cinemo
//
//  Created by BS00484 on 4/6/24.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
    func fetchSearchData(searchedString: String, selectedOrder: String, selectedSortBy: String) -> AnyPublisher<MovieDatabase, Error>
}
