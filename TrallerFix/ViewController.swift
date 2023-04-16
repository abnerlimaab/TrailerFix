//
//  ViewController.swift
//  TrallerFix
//
//  Created by Abner Lima on 15/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    var trailers: [Trailer] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()       
        loadTrailers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trailer = sender as? Trailer else {return}
        let vc = segue.destination as! TrailerViewController
        vc.trailer = trailer
    }
    
    func loadTrailers() {
        guard let url = Bundle.main.url(forResource: "trailers", withExtension: "json") else {return}
        do {
            let trailersData = try Data(contentsOf: url)
            trailers = try JSONDecoder().decode([Trailer].self, from: trailersData)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func randomIndex() -> Int {
        return Int(arc4random_uniform(UInt32(trailers.count)))
    }
    
    func showTrailer(for index: Int) {
        let trailer = trailers[index]
        performSegue(withIdentifier: "trailerSegue", sender: trailer)
    }
    
    @IBAction func watchRandomTrailer(_ sender: UIButton) {
        showTrailer(for: randomIndex())
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let trailer = trailers[indexPath.row]
                
        cell.textLabel?.text = trailer.title
        cell.detailTextLabel?.text = "\(trailer.year)"
        cell.imageView?.image = UIImage(named: trailer.poster)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTrailer(for: indexPath.row)
    }
}
