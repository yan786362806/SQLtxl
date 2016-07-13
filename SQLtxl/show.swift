
//
//  search.swift
//  SQLtxl
//
//  Created by 20141105044y on 16/7/11.
//  Copyright © 2016年 20141105044y. All rights reserved.
//

import UIKit

class show: UIViewController {
    
    var db:SQLiteDB!
    
    @IBAction func qingchu(sender: AnyObject) {
        text5.text=""
    }
    
    @IBAction func qingkong(sender: AnyObject) {
        let sql = "delete from tuser"
        let result = db.execute(sql)
        print(result)
    }
    
    @IBOutlet weak var text5: UITextView!
    
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
    
    @IBAction func showuser(sender: AnyObject) {
        su()
    }
    func su(){
        let data = db.query("select * from tuser")
        for var j=0;j<data.count;j++
        {
            let user = data[j]
            text5.text!+="姓名: "+String(user["uname"]!)+"电话: "+String(user["mobile"]!)+"邮箱: "+String(user["email"]!)+"地址: "+String(user["address"]!)+"\n"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}