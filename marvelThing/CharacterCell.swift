import UIKit

class CharacterCell: UITableViewCell {
    let characterPhoto = UIImageView()
    let characterName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Constants.reUseId)
        
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.textAlignment = .center
        characterName.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        contentView.addSubview(characterName)
        
        
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupConstraints() {
        let constraints = [
            characterName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            
            
            
            
            
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
    
    

}
