//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movies = [Movie]()
    
    var defaultFont: CGFloat = 17   {
        didSet  {
            
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        movies = Movie.allMovies
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fontSettingsController = segue.destination as? FontSettingsController
            else    {
                fatalError("Segue Error")
        }
        
        defaultFont = fontSettingsController.currentFontSize
        fontSettingsController.fontDelegate = self
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.textLabel?.font = UIFont.systemFont(ofSize: defaultFont)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: defaultFont)
        return cell
    }
}

extension ViewController: FontChangedDelegate   {
    func fontChanger(_ fontSize: CGFloat) {
        defaultFont = fontSize
    }
}
