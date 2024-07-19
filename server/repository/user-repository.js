const Database = require("../data/Database")

class UserRepository {
    database
    static instance = null;
    constructor() {
        this.database = Database.getInstance()
    }

    static getInstance(){
        if(this.instance == null) this.instance = new UserRepository()
        return this.instance
    }

    async getAllUser() {
        try {
            const query = "SELECT * FROM User"
            const result = await this.database.query(query)
            return result
        } catch (error) {
            return null
        }
    }

    async getUserByCredential(email, password) {
        try {
            const query = "SELECT * FROM User WHERE email = ? AND password = ?"
            const result = await this.database.query(query, [email, password])
            return result   
        } catch (error) {
            console.error(error)
            return null
        }
    }

    async getUserById(id){
        try {
            const query = "SELECT * FROM User WHERE id = ?"
            const result = await this.database.query(query, [id])
            return result
        }
        catch(error) {
            console.error(error)
            return null
        }
    }
    
    async createUser(id, email, password){
        try {
            const query = 'INSERT INTO User VALUES (?, ?, ?)'
            await this.database.query(query, [id, email, password])   
            return true
        } catch (error) {
            console.error(error)
            return false
        }
    }
}

module.exports = UserRepository