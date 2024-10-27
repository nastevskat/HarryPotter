import UIKit

class CharacterDetailViewController: UIViewController {
    var character: Character?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        guard let character = character else { return }

        let nameLabel = UILabel()
        nameLabel.text = character.fullName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let characterImageView = UIImageView()
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.contentMode = .scaleAspectFit
        loadImage(from: character.image, into: characterImageView)

        let houseLabel = UILabel()
        houseLabel.text = "House: \(character.hogwartsHouse)"
        houseLabel.font = UIFont.systemFont(ofSize: 18)
        houseLabel.translatesAutoresizingMaskIntoConstraints = false

        let actorLabel = UILabel()
        actorLabel.text = "Played by: \(character.interpretedBy)"
        actorLabel.font = UIFont.systemFont(ofSize: 18)
        actorLabel.translatesAutoresizingMaskIntoConstraints = false

        let childrenLabel = UILabel()
        childrenLabel.text = character.children.isEmpty ? "No children" : "Children: \(character.children.joined(separator: ", "))"
        childrenLabel.font = UIFont.systemFont(ofSize: 18)
        childrenLabel.translatesAutoresizingMaskIntoConstraints = false

        let birthdateLabel = UILabel()
        birthdateLabel.text = "Birthdate: \(character.birthdate)"
        birthdateLabel.font = UIFont.systemFont(ofSize: 18)
        birthdateLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(characterImageView)
        view.addSubview(houseLabel)
        view.addSubview(actorLabel)
        view.addSubview(childrenLabel)
        view.addSubview(birthdateLabel)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            characterImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            characterImageView.heightAnchor.constraint(equalToConstant: 200),
            houseLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            houseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            houseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            actorLabel.topAnchor.constraint(equalTo: houseLabel.bottomAnchor, constant: 10),
            actorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            actorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            childrenLabel.topAnchor.constraint(equalTo: actorLabel.bottomAnchor, constant: 10),
            childrenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            childrenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            birthdateLabel.topAnchor.constraint(equalTo: childrenLabel.bottomAnchor, constant: 10),
            birthdateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            birthdateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func loadImage(from urlString: String, into imageView: UIImageView) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
