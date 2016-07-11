//
//  search.swift
//  SQLtxl
//
//  Created by 20141105044y on 16/7/11.
//  Copyright © 2016年 20141105044y. All rights reserved.
//

import UIKit

class search: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var text3: UITextField!
    
    @IBOutlet weak var text4: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增自减）
        db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),mobile varchar(20),adress varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    @IBAction func srarchname(sender: AnyObject) {
        sn()
    }
    func sn(){
    
        text4.text=""
        let a=text3.text!
        let data = db.query("select * from tuser where='\(a)'")
        for (var i=0;i<data.count;i++)
        {
        let user =data[i]}
        text4.text!+="姓名："+String(user["uname"]!)+)
    
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
