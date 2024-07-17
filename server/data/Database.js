const mysql = require('mysql2')

class Database {
    static database = null

    constructor () {
        this.connection = mysql.createConnection({
            host: process.env.DATABSE_HOST,
            port: process.env.DATABASE_PORT,
            database: process.env.DATABASE_NAME,
            user: process.env.DATABASE_USER,
            password: process.env.DATABASE_PASSWORD
        })

        this.connection.connect((err) => {
            if (err) {
                console.error('Error connecting to the database:', err);
            } else {
                console.log('Connected to the database');
            }
        })
        this.database = this
    }

    static getInstance( ){
        if(this.database == null) {
            this.database = new Database()
        }

        return this.database
    }

    query(sql, args){
        return new Promise((resolve, reject) => {
            this.connection.query(sql, args, (err, results) => {
                if(err) return reject(err)
                resolve(results)
            })
        })
    }
}

module.exports = Database