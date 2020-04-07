var express = require('express');
var bodyParser = require('body-parser');
var multer = require('multer');
var upload = multer(); 
var mysql = require('mysql');

var con = mysql.createConnection({  
    host: "localhost",  
    user: "root",  
    password: "Archea123@mysql"  
});

var app = express();
app.use(bodyParser.urlencoded({ extended: true }));

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

app.post('/create', function(req, res){
    con.query("INSERT INTO Company.Employees (Name ,Designation ,Id ,Age ,Gender ,Address ,Salary ,PhoneNo , Boss , Department ) VALUES ('"+req.body.name+"','"+req.body.designation+"','"+req.body.id+"','"+req.body.age+"','"+req.body.gender+"','"+req.body.address+"','"+req.body.salary+"','"+req.body.phoneno+"','"+req.body.boss+"','"+req.body.department+"')",function(err,result){
        if (err) throw err;
        else{
            res.send(result);
        }
    });
    con.query(parseCreate(req.body));
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS, GET");
    res.send('Success');
});

function parseCreate(X) {
    const entries =  {
        id: X.id ? X.id : 'None',
        domain: X.domain ? X.domain : 'None',
        teams: X.teams ? X.teams : 'None'
    }
    return "INSERT INTO Company.AdditionalDetails (Id,Teams,Domain) VALUES ('"+entries.id+"','"+entries.teams+"','"+entries.domain+"')";
}

app.get('/count',function(req,res){
    con.query("SELECT* FROM Company.Employees",function(err,result){
        if(err) throw err;
        res.setHeader("Access-Control-Allow-Origin", "*");
        res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS, GET");
        res.send(result);
    });
});

app.get('/view/:name',function(req,res){

    con.query("SELECT* FROM Company.Employees LEFT JOIN Company.AdditionalDetails USING (Id) WHERE Company.Employees.Name REGEXP '"+req.params.name+"'",function(err,result){
        if (err) throw err;
        res.setHeader("Access-Control-Allow-Origin", "*");
        res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS, GET");
        res.send(result);
    });
});

app.post('/delete/:id',function(req,res){
    con.query("DELETE FROM Company.Employees WHERE Id = '"+req.params.id+"'");
    con.query("SELECT EXISTS(SELECT * FROM Company.AdditionalDetails WHERE Id = '"+req.params.id+"')",function(err,result){
        if (err) throw err;
        if (result === 1){
            con.query("DELETE FROM Company.AdditionalDetails WHERE Id = '"+req.params.id+"'");
        }
    });   
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS, GET");
    res.send('Sucess');
});

app.post('/edit', function(req, res){
    con.query("UPDATE Company.Employees SET Name = '"+req.body.name+"', Designation = '"+req.body.designation+"',Id = '"+req.body.id+"',Age = '"+req.body.age+"',Gender = '"+req.body.gender+"',Address = '"+req.body.address+"',Salary = '"+req.body.salary+"',PhoneNo = '"+req.body.phoneno+"', Boss = '"+req.body.boss+"', Department = '"+req.body.department+"'  WHERE Id ='"+req.body.id+"'");
    if(req.body.teams !== undefined){
        if (req.body.domain === undefined){
            con.query(parseEdit(req.body));
        }
        else{
            con.query(parseEdit(req.body));
        }
    }
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "POST, OPTIONS, GET");
    res.send('Success');
});

function parseEdit(X){
    const entries =  {
        id: X.id ? X.id : 'None',
        domain: X.domain ? X.domain : 'None',
        teams: X.teams ? X.teams : 'None'
    }
    return "UPDATE Company.AdditionalDetails SET Teams = '"+entries.teams+"',Domain = '"+entries.domain+"' WHERE Id = '"+entries.id+"'";
}

app.listen(3000, '192.168.43.132' || '127.0.0.1');