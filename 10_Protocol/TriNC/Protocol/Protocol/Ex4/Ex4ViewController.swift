//
//  Ex4ViewController.swift
//  Protocol
//
//  Created by tri.nguyen on 22/04/2022.
//

import UIKit

final class Ex4ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: - Properties
    var filteredCities: [String] = []
    var cities: [String] = ["London", "Manchester", "Liverpool", "Madrid", "Paris", "Praha", "Hanoi", "BangKok", "Tokyo", "Seoul", "Cairo", "Hawait", "Roma", "Milan", "NewYork", "California", "Sanfrancisco", "Chicago", "Danang", "Saigon", "Vience", "Berlin", "Bayern"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Function
    private func setupUI() {
        title = "World Cities"
        searchBar.delegate = self
        cancelButton.layer.cornerRadius = 12
        cancelButton.layer.masksToBounds = true
    }
    
    private func showCities() {
        var text: String = ""
        for city in cities {
            text += "- \(city)\n"
        }
        textView.text = text
    }
    
    // MARK: - IBAction
    @IBAction private func cancelTouchUpInside(_ sender: Any) {
        showCities()
    }
}

// MARK: - Extention
extension Ex4ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCities = cities
        if searchText.isEmpty == false {
            filteredCities = cities.filter({ $0.contains(searchText)})
        }
        
        var text: String = ""
        for cities in filteredCities {
            text += "- \(cities)\n"
        }
        textView.text = text
    }
}

