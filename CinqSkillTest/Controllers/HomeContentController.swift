//
//  HomeContentController.swift
//  CinqSkillTest
//
//  Created by Flavio Telles Paschoal Santos on 03/09/19.
//  Copyright © 2019 POCS. All rights reserved.
//

import Foundation
import UIKit
import CoreData


var usuarios = [UIUsuarioItem]()


class HomeContentController: UIViewController, UITableViewDataSource,UITableViewDelegate,UITabBarDelegate {
    
    
    @IBOutlet weak var barBtAdicionar: UIBarButtonItem!
    @IBOutlet weak var barBtProcurar: UIBarButtonItem!
    @IBOutlet weak var barBtEditar: UIBarButtonItem!
    @IBOutlet weak var barBtExcluir: UIBarButtonItem!
    
    @IBOutlet weak var tabBarMenu: UITabBarItem!
    
    @IBOutlet weak var tabBarUsuarios: UITabBar!
    @IBOutlet weak var tableViewUsuarios: UITableView!
    
    weak var delegate: HomeContentDelegate?
    
    override func viewDidLoad() {
        
        //tvUsuarios.register(UITableViewCell.self, forceCellReuseIdentifier:"id")
        hideEditButtons()
        
        tableViewUsuarios.delegate = self
        tableViewUsuarios.dataSource = self
        tabBarUsuarios.delegate = self
        
        
        //persistSampleUsers()
        
        loadSamples()
    }
    
    
    func hideEditButtons(){
        barBtExcluir.isEnabled = false
        barBtEditar.isEnabled = false
        
        barBtExcluir.tintColor = UIColor.clear
        barBtEditar.tintColor = UIColor.clear
        
    }
    
    
    func loadSamples(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                
                let nome = data.value(forKey: "nome") as! String
                let senha = data.value(forKey: "senha") as! String
                let email = data.value(forKey: "email") as! String
                
//                context.delete(data)
//                try context.save()

                usuarios.append( UIUsuarioItem(nome: nome, email: email, senha: senha) )
             
            }
            
        
        } catch {
            print("Failed")
        }
        

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usuarioCell", for: indexPath)
        
        cell.textLabel?.text = usuarios[indexPath.row].nome
        
        return cell
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        delegate?.onMenuToggle()
    }
    
    
    func persistSampleUsers(){
        
        createUserSample("João", "1", "joao@email.com")
        createUserSample("Jose","1","Jose@email.com")
        createUserSample("Arnaldo","1","Arnaldo@email.com")
        createUserSample("Roberto","1","Roberto@email.com")
        createUserSample("Henrique","1","Henrique@email.com")
        createUserSample("Kleber","1","Kleber@email.com")
        createUserSample("Fabio","1","Fabio@email.com")

    }
   
    func createUserSample(_ nome:String, _ senha:String, _ email:String  ){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entidadeUser = NSEntityDescription.entity(forEntityName: "Usuarios", in: context)
        
        let novoUsuario = NSManagedObject(entity: entidadeUser!, insertInto: context)
        
        novoUsuario.setValue(nome, forKey: "nome")
        novoUsuario.setValue(senha, forKey: "senha")
        novoUsuario.setValue(email, forKey: "email")
        
        do{
                try context.save()
        }catch{
            print("Failed saving")
        }
        
    }
}

