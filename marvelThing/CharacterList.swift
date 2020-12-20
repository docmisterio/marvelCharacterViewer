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
        
        let heroAtPath = hero[indexPath.row]
        cell.characterName.text = heroAtPath.name
        
        // Considerations here: if the call takes too long, you might end up loading images
        // into old/wrong cells. For network calls with lag like this, you should learn to account for
        // slow queries, etc.
        if let heroPhotoUrl = URL(string: "\(heroAtPath.thumbnail.path).\(heroAtPath.thumbnail.extension)"),
           var components = URLComponents(url: heroPhotoUrl, resolvingAgainstBaseURL: true) {
            print(heroPhotoUrl.absoluteString)
            components.scheme = "https"
            
            if let secureUrl = components.url, let data = try? Data(contentsOf: secureUrl) {
                cell.characterPhoto.image = UIImage(data: data)
            }
        }
        return cell
    }
}


