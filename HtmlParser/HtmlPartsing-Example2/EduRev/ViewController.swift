//
//  ViewController.swift
//  EduRev
//
//  Created by SOWJI on 13/11/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tableData = [Questionnaire]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 2000
        DataManager.fetchQuestionnaire { (items) in
            self.tableData = items
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath) as? QuestionCell else {
            return UITableViewCell()
        }
        let questionnaire = self.tableData[indexPath.row]
        let question = questionnaire.fPost ?? ""
        let answer = questionnaire.pAnswer ?? ""
        cell.title.text = "Problem \(indexPath.row + 1)"
        cell.question.attributedText = self.replacesrc(question).htmlToAttributedString
        cell.answer.attributedText = self.replacesrc(answer).htmlToAttributedString
        return cell
    }
    func replacesrc(_ text : String) -> String {
        text.replacingOccurrences(of: "<img src", with: "<img width=\(UIScreen.main.bounds.width - 30) src")
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}
