var express = require('express');
const bodyParser = require("body-parser");
var app = express();
var mysql = require('mysql');

app.use(bodyParser.json())
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

var urlencodedParser = bodyParser.urlencoded({ extended: false })

var server = app.listen(8081, function () {
  var host = server.address().address
  var port = server.address().port
  
  console.log("Example app listening at http://%s:%s", host, port)
})

app.get("/", (req, res) => {
  res.json({ message: "ok" });
});

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "mydb"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

// This responds with "Hello World" on the homepage
app.get('/listelehasta', function (req, res) {
  console.log("Hastalar listelendi:");
  con.query("SELECT * FROM mydb.hasta", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
    res.end();
  });
})

app.get('/listeledoktor', function (req, res) {
  console.log("Doktorlar listelendi:");
  con.query("SELECT * FROM mydb.doktor", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
    res.end();
  });
})

/*
app.get('/hastagiris', function (req, res) {
  console.log("Hasta Giris:");
  var ad = req.query.ad
  var soyad = req.query.soyad
  var mail = req.query.mail
  var sifre = req.query.sifre

  con.query("SELECT * FROM mydb.hasta WHERE hasta_mail = ? AND hasta_sifre = ?",[mail, sifre], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
    res.end();
  });
})
*/

app.post('/hastagiris', urlencodedParser, function (req, res) {
  console.log("Hasta giris bilgileri kontrol ediliyor.");

  console.log(req.body);

  var mail = req.body.email;
  var sifre = req.body.username;
  
  var sql = "SELECT * FROM mydb.hasta WHERE hasta_mail = ? AND hasta_sifre = ?";

  con.query(sql,[mail, sifre], function (err, result, fields) {
    if (err) throw err;
    if (result[0] == null){
      res.status(299);
    }
    res.json(result);
    res.end();
  });  
})

app.post('/hastaekleme', urlencodedParser, function (req, res) {
  console.log("Hasta ekleniyor.");

  var ad = req.body.hasta_ad;
  var soyad = req.body.hasta_soyad;
  var mail = req.body.hasta_mail;
  var sifre = req.body.hasta_sifre;


  
  var sql = "INSERT INTO hasta (hasta_ad, hasta_soyad, hasta_mail, hasta_sifre) VALUES ?";
  var values = [
    [ad, soyad, mail, sifre]
  ]

  con.query(sql,[values], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
  
})

app.get('/kisi', function (req, res) {
  console.log("Kisi Sayfasi");
  var ad = req.query.ad
  var soyad = req.query.soyad
  con.query("SELECT * FROM mydb.hasta WHERE hasta_ad = ?",[ad], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
})

/*
app.get('/hastaekle', function (req, res) {
  console.log("Hasta ekleniyor.");

  var ad = req.query.ad
  var soyad = req.query.soyad
  var mail = req.query.mail
  var sifre = req.query.sifre

  var sql = "INSERT INTO hasta (hasta_ad, hasta_soyad, hasta_mail, hasta_sifre) VALUES ?";
  var values = [
    [ad, soyad, mail, sifre]
  ]

  con.query(sql,[values], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
})
*/

/*
app.get('/doktorekle', function (req, res) {
  console.log("Doktor ekleniyor.");

  var id = req.query.id;
  var ad = req.query.ad;
  var soyad = req.query.soyad;
  var fak = req.query.fak;
  var uzman = req.query.uzman;
  var hane = req.query.hane;
  var klinik = req.query.klinik;
  //var resim = req.query.resim;

  var sql = "INSERT INTO doktor (iddoktor, doktor_ad, doktor_soyad, doktor_fak, doktor_uzm, doktor_hane, doktor_klinik) VALUES ?";
  var values = [
    [id, ad, soyad, fak, uzman, hane, klinik]
  ]

  con.query(sql,[values], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
})
*/

app.post('/doktorekleme', urlencodedParser, function (req, res) {
  console.log("Doktor ekleniyor.");

  console.log(req.body.email);

  var ad = req.body.doktor_ad;
  var soyad = req.body.doktor_soyad;
  var mail = req.body.doktor_mail;
  var sifre = req.body.doktor_sifre;
  var fak = req.body.doktor_fak;
  var hane = req.body.doktor_hane;
  var uzman = req.body.doktor_uzman;
  var klinik = req.body.doktor_klinik;
  
  //var resim = req.body.resim;

  
  var sql = "INSERT INTO doktor (doktor_ad, doktor_soyad, doktor_mail, doktor_sifre, doktor_uzm, doktor_fak, doktor_hane, doktor_klinik) VALUES ?";
  var values = [
    [ad, soyad, mail, sifre, uzman, fak, hane, klinik]
  ]

  con.query(sql,[values], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
  
})

app.post('/doktorgiris', urlencodedParser, function (req, res) {
  console.log("Doktor giris kontrol ediliyor.");

  console.log(req.body);

  var mail = req.body.email;
  var sifre = req.body.username;
  
  var sql = "SELECT * FROM mydb.doktor WHERE doktor_mail = ? AND doktor_sifre = ?";

  con.query(sql,[mail, sifre], function (err, result, fields) {
    if (err) throw err;
    if (result[0] == null){
      res.status(299);
    }
    res.json(result);
    res.end();
  });  
})

app.get('/doktorara', function (req, res) {
  console.log("Doktor Aranıyor");
  var ad = req.query.ad;
  var uzmanlik = req.query.uzmanlik;
  con.query("SELECT * FROM mydb.doktor WHERE doktor_ad = ? OR doktor_uzm = ?",[ad,uzmanlik], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
})

app.get('/hastaara', function (req, res) {
  console.log("Hasta Aranıyor");

  var ad = req.query.ad;

  con.query("SELECT * FROM mydb.doktor WHERE hasta_ad = ? ",[ad], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
})

/*
app.get('/hastasil', function (req, res) {
  console.log("Arama Sayfasi");

  var ad = req.query.ad;

  var sql = "DELETE FROM hasta WHERE hasta_ad = ?";
  var values = [
    [ad]
  ]

  con.query(sql,[values], function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    res.json(result);
  });
})
*/