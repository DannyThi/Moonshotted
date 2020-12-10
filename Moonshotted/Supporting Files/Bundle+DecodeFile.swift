//
//  Bundle+DecodeFile.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/07.
//

import Foundation

extension Bundle {
   func decode<T:Decodable>(_ file: String) -> T {
      guard let url = self.url(forResource: file, withExtension: nil) else {
         fatalError("Failed to load \(file) from bundle.")
      }
      guard let data = try? Data(contentsOf: url) else {
         fatalError("Failed to load \(file) from bundle.")
      }
      
      let decoder = JSONDecoder()
      let formatter = DateFormatter()
      formatter.dateFormat = "y-MM-dd"
      decoder.dateDecodingStrategy = .formatted(formatter)
      
      guard let loaded = try? decoder.decode(T.self, from: data) else {
         fatalError("Failed to load \(file) from bundle.")
      }
      
      return loaded
   }
}
