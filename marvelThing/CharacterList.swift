import UIKit

class CharacterList: UITableViewController {
    private let cellReuseId = Constants.reUseId
    private lazy var hero = [Character]()
    
    override func loadView() {
        super.loadView()
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellReuseId)
        
        let ts = Constants.ts
        let apiKey = Constants.apiKey
        let hash = Constants.hash
        let baseUrlString = Constants.baseUrlString
        
        let urlString = "\(baseUrlString)ts=\(ts)&apikey=\(apiKey)&hash=\(hash)"
        print(urlString)
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
    }
    
    func parse(json: Data!) {
        let decoder = JSONDecoder()
        
        struct MarvelResponse: Codable {
            let data: MarvelData
        }
        
        struct MarvelData: Codable {
            var results: [Character]
        }
        
        if let jsonChars = try? decoder.decode(MarvelResponse.self, from: json) {
            hero = jsonChars.data.results
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hero.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! CharacterCell
        
        cell.characterName.text = hero[indexPath.row].name
        // next up - figure out how to load an image from a url. NOTE: it's already a data task coming through the network
        
        return cell
    }
}


