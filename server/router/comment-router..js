const CommentController = require("../controllers/comment-controller")

class CommentRouter {
    app
    commentController
    constructor(app){ 
        this.app = app
        this.commentController = CommentController.getInstance()
        this.init()
    }

    init(){
        this.app.get('/comment/:id', this.commentController.getCommentByGameId)
        this.app.post('/comment', this.commentController.createComment)
    }
}

module.exports = CommentRouter 
