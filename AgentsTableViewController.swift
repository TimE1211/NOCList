//
//  AgentsTableViewController.swift
//  NOCList
//
//  Created by Timothy Hang on 3/16/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class AgentsTableViewController: UITableViewController
{
  var agents = [Agent]()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
//    agents.append(Agent(coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8))
//    agents.append(Agent(coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9))
//    agents.append(Agent(coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5))
//    agents.append(Agent(coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10))
//    agents.append(Agent(coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4))
    loadAgents()
    tableView.tableFooterView = UIView(frame: .zero)
    title = "NOC List"
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int
  {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return agents.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AgentCell", for: indexPath)

    // Configure the cell...
    let anAgent = agents[indexPath.row]
    cell.textLabel?.text = anAgent.coverName
    return cell
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    
    let selectedIndexPath = tableView.indexPath(for: sender as! UITableViewCell)!
    let selectedAgent = agents[selectedIndexPath.row]
    let agentDetailVC = segue.destination as! AgentsDetailViewController
    agentDetailVC.agent = selectedAgent
  }
  
  func loadAgents()
  {
    do
    {
      let filePath = Bundle.main.path(forResource: "NOC", ofType: "json")
      let dataFromFile = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
      let agentData: [[String: Any]] = try JSONSerialization.jsonObject(with: dataFromFile!, options: []) as! [[String: Any]]
      for agentDictionary in agentData
      {
        let anAgent = Agent(agentDictionary: agentDictionary)
        agents.append(anAgent)
      }
    }
    catch let error as NSError
    {
      print(error)
    }
  }
  
}
