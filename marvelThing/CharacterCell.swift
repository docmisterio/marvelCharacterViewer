import UIKit

class CharacterCell: UITableViewCell {
    var characterPhoto = UIImageView()
    let characterName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: Constants.reUseId)
        
        characterName.translatesAutoresizingMaskIntoConstraints = false
        characterName.textAlignment = .center
        characterName.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        contentView.addSubview(characterName)
        characterPhoto.translatesAutoresizingMaskIntoConstraints = false
        characterPhoto.layer.cornerRadius = 100
        contentView.addSubview(characterPhoto)
        
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
            characterPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            characterPhoto.heightAnchor.constraint(equalToConstant: 44),
            characterPhoto.widthAnchor.constraint(equalToConstant: 44),

            characterName.leadingAnchor.constraint(equalTo: characterPhoto.trailingAnchor, constant: 10),
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
    
    

}
