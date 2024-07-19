const { v4 } = require("uuid")
const GameRepository = require("../repository/game-repository")
const { request } = require("express")

class GameController {
    static instance = null
    gameRepository

    constructor (){
        this.gameRepository = GameRepository.getInstance()

        this.createGame = this.createGame.bind(this)
        this.updateGame= this.updateGame.bind(this)
        this.getGameById = this.getGameById.bind(this)
        this.deleteGameById = this.deleteGameById.bind(this)
        this.getAllGame = this.getAllGame.bind(this)
    }

    static getInstance() {
        if(this.instance == null) return this.instance = new GameController()
        return this.instance
    }

    async getAllGame(req, res){
        try {
            const games = await this.gameRepository.getAllGame()
            res.status(200).send(games)
        } catch (error) {
            console.error(error)
            res.status(501).send("Something went wrong")
        }
    }

    async deleteGameById(req, res){
        try {
            const gameId = req.params.id
            const result = await this.gameRepository.deleteGame(gameId)
            console.log(result)
            const message = result ? "Delete success" : "Something went wrong when deleting"
            res.status(200).send(message)
        } catch (error) {
            console.error(error)
            res.status(404).send("Something went wrong")
        }
    }

    async getGameById(req, res){
        try {
            const gameId = req.params.id
            console.log(`game id ${gameId}`)
            const game = await this.gameRepository.getGameById(gameId)
            if(game == null) res.status(404).send("there is no user")
            res.status(200).send(game);
        } catch (error) {
            console.error(error)
            res.status(404).send("something went wrong")
        }
    }

    async updateGame(req, res){ 
        const requestBody = req.body
        
        try {
            const game = {
                id: requestBody.id,
                name: requestBody.name,
                description: requestBody.description,
                price: requestBody.price
            }

            await this.gameRepository.updateGame(game.id, game.name, game.description, game.price)
            res.status(200).send(true)
        } catch (error) {
            console.log(error)
            res.status(404).send(null)
        }
    }

    async createGame(req, res){
        const requestBody = req.body
        try {
            const game = {
                id: v4(),
                name: requestBody.name,
                description: requestBody.description,
                price: requestBody.price
            }

            await this.gameRepository.createGame(game.id, game.name, game.description, game.price)

            res.status(200).send(game)   
            
        } catch (error) {
            console.error(error)
            res.status(404).send(null)
        }
    }
}

module.exports = GameController