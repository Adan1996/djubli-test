const Pool = require("pg").Pool;

const pool = new Pool({
    "username": "djubli",
    "password": "djubli",
    "database": "data_penjualan_mobil",
    "host": "localhost",
    "port": 5432
})

module.exports = pool;