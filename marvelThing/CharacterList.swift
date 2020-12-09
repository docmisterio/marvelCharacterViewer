import UIKit

class CharacterList: UITableViewController {
    let cellReuseId = "cell"
    var marvelResponse = [MarvelData]()
    var heroes = [Characters]()
    
    override func loadView() {
        super.loadView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseId)
        
        let ts = "1"
        let apiKey = "5ab6fe0b9f2d5c4047477c3823b10b8c"
        let hash = "7698eaa1dea7967ec626da56881a5c56"
        let baseUrlString = "https://gateway.marvel.com/v1/public/characters?"
        
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
        if let jsonChars = try? decoder.decode(MarvelResponse.self, from: json) {
            marvelResponse = [jsonChars.data]
            
            print("marvel response:\(marvelResponse)") // returns 20 chars like this "marvelThing.Characters(name: Iron Man)"
            
            tableView.reloadData()
        }
    }
    
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marvelResponse.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
        
        cell.textLabel?.text = "things"
        
        return cell
    }
    
}
