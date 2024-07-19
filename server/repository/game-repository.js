const { authPlugins } = require("mysql2")
const Database = require("../data/Database")

class GameRepository {
    static instance = null
    database

    constructor (){ 
        this.database = Database.getInstance()
    }

    static getInstance(){
        if(this.instance == null) this.instance = new GameRepository()
        return this.instance
    }

    async createGame(id, name, description, price){
        try {
            const query = "INSERT INTO Game VALUES (?, ?, ?, ?)"
            console.log('creating game')
            await this.database.query(query, [id, name, description, price])   
            return true
        } catch (error) {
            console.error(error)
            return false
        }
    }

    async updateGame(id, name, description, price){
        try {
            const query = "UPDATE Game SET name = ?, description = ?, price = ? WHERE id = ?"
            await this.database.query(query, [name, description, price, id])
            return true
        } catch (error) {
            console.error(error)
            return false
        }
    }

    async getGameById(gameId){
        try {
            const query = "SELECT * FROM Game WHERE id = ?"
            const result = await this.database.query(query, [gameId])

            return result[0]
        } catch (error) {
            console.error(error)
            return null
        }
    }

    async getAllGame(){
        try {
            const query = "SELECT * FROM Game"
            const result = await this.database.query(query)   
            return result
        } catch (error) {
            return null
        }
    }

    async deleteGame(gameId){
        try {
            const query = "DELETE FROM Game WHERE id = ?"
            await this.database.query(query, [gameId])
            return true
        } catch (error) {
            return false
        }
    }
}

module.exports = GameRepository