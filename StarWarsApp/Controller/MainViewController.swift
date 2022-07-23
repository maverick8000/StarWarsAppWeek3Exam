//
//  MainViewController.swift
//  StarWarsApp
//
//  Created by Raul Barranco on 7/22/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let network: NetworkManager = NetworkManager()
    var currentPage: Int = 1
    var currentPage2: Int = 1
    var charactersInfo: [Characters] = []
    var characterFilms: [String] = []
    var filmArr: [Characters] = []
    
    var nameCache: [Int: String] = [:]
    var eyeColorCache: [Int: String] = [:]
    var hairColorCache: [Int: String] = [:]
    var homeworldCache: [Int: String] = [:]
    var filmsCache: [Int: [String]] = [:]

//    lazy var characterTable: UITableView = {
//        let table = UITableView(frame: .zero)
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.dataSource = self
//        table.backgroundColor = .black
//        table.delegate = self
//        //Register Cell
//        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseId)
//        return table
//    }()
    
    lazy var characterTable2: UITableView = {
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .systemRed
        table.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseId)
        return table
        
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        self.setUpUI()
        
        self.requestPage()
        

    }
    
    private func setUpUI() {
        
        //self.view.backgroundColor = UIColor(red: 1.00, green: 0.84, blue: 0.80, alpha: 1.00)
        //self.view.backgroundColor = UIColor(red: 0.86, green: 0.80, blue: 1.00, alpha: 1.00)
        //self.view.backgroundColor = UIColor(red: 1.00, green: 0.80, blue: 0.80, alpha: 1.00)
        //self.view.backgroundColor = UIColor(red: 1.00, green: 0.10, blue: 0.10, alpha: 1.00)
        //self.view.backgroundColor = .white
        //self.view.addSubview(self.characterTable)
        
        self.view.backgroundColor = .systemTeal
        self.view.addSubview(self.characterTable2)
        self.characterTable2.bindToSuperView()
        
    }
    
    private func requestPage() {
        

        self.network.fetchPage(urlStr: "https://swapi.dev/api/people/?page=\(self.currentPage)") { result in
            
            switch result {
                
                
                case .success(let page):
                    
                    print("\n\n\n\n\n00000##############################################################")
                    print(page)
                    print("##############################################################00000\n\n\n\n\n")
                    self.currentPage += 1
                    //self.charactersInfo.append(contentsOf: page.results)
                    self.charactersInfo = page.results
                
                    self.filmArr = page.results
                                
//                for index in 0..<self.characterFilms.count {
//
//                    tempArr2.append(self.characterFilms[index].)
//
//                }

                DispatchQueue.main.async {
                    self.characterTable2.reloadData()
                }
                    
                case .failure(let error):
                    print("\n\n\n\n\n11111##############################################################")
                    print(error)
                    print("##############################################################11111\n\n\n\n\n")
                
            }
                
            
        }
        
    }
    


}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charactersInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseId, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        print("\n\n\n\n\n33333##############################################################")
        print(indexPath)
        print("##############################################################33333\n\n\n\n\n")
        cell.configure(name: self.charactersInfo[indexPath.row].name)
        cell.configure(eyeColor: self.charactersInfo[indexPath.row].eye_color)
        cell.configure(hairColor: self.charactersInfo[indexPath.row].hair_color)
        cell.configure(homeworld: self.charactersInfo[indexPath.row].homeworld)
        
        self.nameCache[indexPath.row] = self.charactersInfo[indexPath.row].name
        self.eyeColorCache[indexPath.row] = self.charactersInfo[indexPath.row].eye_color
        self.hairColorCache[indexPath.row] = self.charactersInfo[indexPath.row].hair_color
        self.homeworldCache[indexPath.row] = self.charactersInfo[indexPath.row].homeworld
        
        self.network.fetchPage(urlStr: "https://swapi.dev/api/people/?page=\(self.currentPage2)") { (result: Result<Character, Error>) in
            
            //var tempArr: [String] = []
            
            switch result {
                
                
                case .success(let page):
                    
                    print("\n\n\n\n\n44444##############################################################")
                    print(page)
                    print("##############################################################44444\n\n\n\n\n")
                    self.currentPage2 += 1
                    //self.charactersInfo.append(contentsOf: page.results)
                    //self.charactersInfo = page.results
                    //self.filmArr = page.results
                
                    self.filmsCache[indexPath.row] = page.results[indexPath.row].films
                    //tempArr = page.results[indexPath.row].films
                

//                DispatchQueue.main.async {
//                    self.characterTable2.reloadData()
//                }
                    
                case .failure(let error):
                    print("\n\n\n\n\n55555##############################################################")
                    print(error)
                    print("##############################################################55555\n\n\n\n\n")
                
            }

        }
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController(textText: nameCache[indexPath.row]!, eyeColor: eyeColorCache[indexPath.row]!, hairColor: hairColorCache[indexPath.row]!, homeworld: homeworldCache[indexPath.row]!, films: filmsCache[indexPath.row] ?? ["no films registered"])
//        let detailVC = DetailViewController(textText: nameCache[indexPath.row]!, eyeColor: eyeColorCache[indexPath.row]!, hairColor: hairColorCache[indexPath.row]!, homeworld: homeworldCache[indexPath.row]!)
        self.navigationController?.pushViewController(detailVC, animated: true)
        self.navigationController?.navigationBar.tintColor = .white
    
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == self.nameCache.count - 1 {
            self.requestPage()
        }
    
    }
    
}
