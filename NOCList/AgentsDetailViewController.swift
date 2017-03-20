//
//  DetailViewController.swift
//  NOCList
//
//  Created by Timothy Hang on 3/18/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
// David and I worked on this ahead of time , where he was teaching me how to do certain thing to make the detail view work

import UIKit

class AgentsDetailViewController: UIViewController
{
  @IBOutlet weak var covernameLabel: UILabel!
  @IBOutlet weak var realnameLabel: UILabel!
  @IBOutlet weak var accessLevelLabel: UILabel!
  var agent: Agent!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    covernameLabel.text = agent.coverName
    realnameLabel.text = agent.realName
    accessLevelLabel.text = "Access Level: " + String(agent.accessLevel)
  }
}
