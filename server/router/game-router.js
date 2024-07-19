const GameController = require("../controllers/game-controller")

class GameRouter {
    app
    gameController
    constructor(app){ 
        this.app = app
        this.gameController = GameController.getInstance()
        this.init()
    }

    init(){
        this.app.post("/game", this.gameController.createGame)
        this.app.put('/game', this.gameController.updateGame)
        this.app.get('/game/:id', this.gameController.getGameById)
        this.app.delete('/game/:id', this.gameController.deleteGameById)
        this.app.get('/game', this.gameController.getAllGame)
    }
}

module.exports = GameRouter