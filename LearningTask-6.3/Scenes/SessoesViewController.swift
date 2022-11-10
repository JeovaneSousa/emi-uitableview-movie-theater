//
//  ViewController.swift
//  LearningTask-6.3
//
//  Created by rafael.rollo on 14/04/2022.
//

import UIKit

class SessoesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sessoesTableView: UITableView!
    
    var movie: Movie!
    var listaDeSessoes: [Sessions]?
    var movieApi: MovieSessionsAPI!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sessoesTableView.delegate = self
        sessoesTableView.dataSource = self
        sessoesTableView.tableHeaderView = TableHeaderView.build(from: movie!)
        loadSessoes()
        sectionHeaderViewSetup()


    }
    
    func sectionHeaderViewSetup(){
        sessoesTableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        sessoesTableView.sectionHeaderHeight = TableSectionHeaderView.heightConstant
    }
    
    func loadSessoes(){
        guard let movieApi = movieApi else {return}
        listaDeSessoes = movieApi.getSessionBy(movie!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listaDeSessoes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  listaDeSessoes?[section].comingSessions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessoesCell", for: indexPath) as? SessoesTableViewCell else {
            fatalError("Não foi possível retornar uma célula")
        }
        
        let session = listaDeSessoes![indexPath.section].comingSessions[indexPath.row]
        cell.setup(session)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else{
            fatalError("Não foi possível retornar as sessões")
        }
        
        let cinema = listaDeSessoes![section].cinema
        header.setup(cinema)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
