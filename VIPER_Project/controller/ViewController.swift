//
//  ViewController.swift
//  VIPER_Project
//
//  Created by Amarprakash Mishra on 08/05/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//


protocol PresenterProtocol {
    func reloadTableViewData()
}

import UIKit

class ViewController: UITableViewController, StartDelegate {
    var interator: PayloadInteractor?
    var presenter: AddPresenterLogic?
    var cell: payloadCell1?
    var header: Header?
    var footer: Footer?
    var selectYear: SelectYearVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        header?.button1.backgroundColor = .lightGray
        presenter?.initialContactInteractor()
        tableView.register(payloadCell1.self, forCellReuseIdentifier: "payloadCellId1")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.register(Footer.self, forHeaderFooterViewReuseIdentifier: "footerId")
    }
    
    func initialization() {
        interator = PayloadInteractor()
        presenter = PayLoadPresenter()
        selectYear = SelectYearVC()
        presenter?.interactor = interator
        presenter?.viewController = self
        interator?.presenter = presenter as? PayLoadPresenter
        selectYear?.presenter = presenter as? PayLoadPresenter
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.fields.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "payloadCellId1", for: indexPath) as? payloadCell1
        cell?.label.text = presenter?.fields[indexPath.row].displayName
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? Header
        header?.delegate = self
        return header
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footerId") as? Footer
        footer?.delegate = self
        return footer
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectYear = SelectYearVC()
//        presenter?.selectYear = selectYear
//        presenter?.setDataToSelectVC(selectedRow: indexPath.row)
        presenter?.contactInteractor(selectYear: selectYear!, selectedRow: indexPath.row)
        selectYear!.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(selectYear!, animated: true, completion: nil)
    }
    
    func startOverPressed() {
        viewDidLoad()
    }
    
    func reloadTableViewData() {
        tableView.reloadData()
    }
}

extension ViewController: PushDelegate {
    func didTapOnFindInformation(_ title: String) {
        let svc = SecondViewController()
        navigationController?.pushViewController(svc, animated: true)
    }
}
