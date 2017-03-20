//
//  Agent.swift
//  NOCList
//
//  Created by Timothy Hang on 3/16/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

class Agent
{
  var coverName: String
  var realName: String
  var accessLevel: Int
  init (coverName: String, realName: String, accessLevel: Int)
  {
    self.coverName = coverName
    self.realName = realName
    self.accessLevel = accessLevel
  }
  init(agentDictionary: [String: Any])
  {
    self.coverName = agentDictionary["coverName"] as! String
    self.realName = agentDictionary["realName"] as! String
    self.accessLevel = agentDictionary["accessLevel"] as! Int
  }
}
