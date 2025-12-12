const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const app = express();

app.use(express.json());
app.use(cors());


const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "12345", 
  database: "pokedex",
});

db.connect((err) => {
  if (err) {
    console.error("❌ Error al conectar a MySQL:", err);
    return;
  }
  console.log("✅ Conectado a MySQL");
});


app.post("/login", (req, res) => {
  return res.json({ status: "ok", message: "Ruta login funcionando" });
});


app.post("/signup", (req, res) => {
  return res.json({ status: "ok", message: "Ruta signup funcionando" });
});


app.listen(3000, () => {
  console.log("🚀 Servidor corriendo en http://localhost:3000");
});



