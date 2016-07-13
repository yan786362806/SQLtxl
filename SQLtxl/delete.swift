//
//  delete.swift
//  SQLtxl
//
//  Created by 20141105044y on 16/7/8.
//  Copyright © 2016年 20141105044y. All rights reserved.
//

import UIKit

class delete: UIViewController {
    
    var db:SQLiteDB!
    
    
    @IBOutlet weak var text1: UITextField!
    
    
    @IBOutlet weak var text2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增自减）
        db.execute("create table if not exists tuser(uid integer primary key,uname varchar(20),mobile varchar(20),email varchar(20),address varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    //点击保存
    
    @IBAction func deletename(sender: AnyObject) {
        deleteuser()
    }
    func deleteuser(){
        let value=text1.text!
        let sql = "delete from tuser where mobile='\(value)' "
        let result = db.execute(sql)
        print(result)
    }

    @IBAction func deletenum(sender: AnyObject) {
        deletenum()
    }
    func deletenum(){
        let value1=text2.text!
        let sql = "delete from tuser where mobile='\(value1)' "
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
