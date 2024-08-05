const CommentRepository = require("../repository/comment-repository")
const { v4 } = require("uuid")

class CommentController {
    static instance = null
    commentRepository

    constructor() {
        this.commentRepository = CommentRepository.getInstance();
        
        this.createComment = this.createComment.bind(this)
        this.getCommentByGameId = this.getCommentByGameId.bind(this)
    }

    static getInstance(){
        if(this.instance == null) this.instance = new CommentController()
        return this.instance
    }

    async createComment(req, res){
        try {
            const requestBody = req.body
            console.log(requestBody)
            const id = v4()
            const result = await this.commentRepository.createComment(id, requestBody.userId, requestBody.gameId, requestBody.text)
            const message = result ? "Success creating comment" : "Something went wrong"

            res.status(200).send(message)
        } catch (error) {
            console.log(error);
            res.status(501).send("Somethign went wrong")
        }
    }

    async getCommentByGameId(req, res){
        try {
            const gameId = req.params.id
            const result = await this.commentRepository.getCommentByGameId(gameId)
            res.status(200).send(result)   
        } catch (error) {
            console.log(error);
            res.status(501).send("Something went wrong")
        }
    }
}

module.exports = CommentController
