//
//  Mission.swift
//  Moonshotted
//
//  Created by Hai Long Danny Thi on 2020/12/07.
//

import Foundation
struct CrewRole: Codable {
   let name: String
   let role: String
}

struct Mission: Codable, Identifiable {
   let id: Int
   let crew: [CrewRole]
   let description: String
   let launchDate: Date?
   
   var image: String {
      return "apollo\(self.id)"
   }
   
   var displayName: String {
      return "Apollo \(self.id)"
   }
   
   var formattedLaunchDate: String {
      if let launchDate = launchDate {
         let formatter = DateFormatter()
         formatter.dateStyle = .long
         return formatter.string(from: launchDate)
      } else {
         return "N/A"
      }
   }
}
