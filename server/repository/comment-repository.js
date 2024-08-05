const Database = require("../data/Database")

class CommentRepository{ 
    static instance = null
    database

    constructor(){ 
        this.database = Database.getInstance()
    }

    static getInstance (){
        if(this.instance == null) this.instance = new CommentRepository()
        return this.instance
    }

    async getCommentByGameId(gameId){
        try {
            const query = "SELECT c.*, u.Email FROM Comment c JOIN User u ON u.Id = c.UserId WHERE GameId = ?"
            const result = await this.database.query(query, [gameId])
            return result
        } catch (error) {
            console.error(error)
            return null
        }
    }

    async createComment(id, userId, gameId, text){
        try {
            const query = "INSERT INTO Comment VALUES (?, ?, ?, ?)"
            await this.database.query(query, [id, gameId, userId, text])   
            return true
        } catch (error) {
            console.log(error);
            return false
        }
    }
}

module.exports = CommentRepository
