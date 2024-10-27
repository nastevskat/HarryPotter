import UIKit

class BookDetailViewController: UIViewController {
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        guard let book = book else { return }

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.spacing = 16
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)

        let bookImageView = UIImageView()
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.contentMode = .scaleAspectFit
        if let url = URL(string: book.cover) {
            loadImage(from: url, into: bookImageView)
        } else {
            print("Invalid URL for book cover: \(book.cover)")
        }

        let titleLabel = UILabel()
        titleLabel.text = book.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let originalTitleLabel = UILabel()
        originalTitleLabel.text = "Original Title: \(book.originalTitle)"
        originalTitleLabel.font = UIFont.systemFont(ofSize: 18)
        originalTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        let releaseDateLabel = UILabel()
        releaseDateLabel.text = "Release Date: \(book.releaseDate)"
        releaseDateLabel.font = UIFont.systemFont(ofSize: 18)
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false

        let pagesLabel = UILabel()
        pagesLabel.text = "Pages: \(book.pages)"
        pagesLabel.font = UIFont.systemFont(ofSize: 18)
        pagesLabel.translatesAutoresizingMaskIntoConstraints = false

        let descriptionLabel = UILabel()
        descriptionLabel.text = book.description
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentStackView.addArrangedSubview(bookImageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(originalTitleLabel)
        contentStackView.addArrangedSubview(releaseDateLabel)
        contentStackView.addArrangedSubview(pagesLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
    }

    private func loadImage(from url: URL, into imageView: UIImageView) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
