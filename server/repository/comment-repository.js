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
        const query = "SELECT * FROM Comment WHERE GameId = ?"
        this.database
        
    }

    async createComment(id, userId, gameId, text){

    }
}