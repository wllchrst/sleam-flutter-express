const UserRepository = require("../repository/user-repository")

class UserController {
    static instance = null
    userRepository

    constructor() {
        this.userRepository = UserRepository.getInstance()

        this.getAllUser = this.getAllUser.bind(this)
        this.loginUser = this.loginUser.bind(this)
    }

    static getInstance() {
        if(this.instance == null) this.instance = new UserController()
        return this.instance
    }

    async getAllUser(req, res){
        const users = await this.userRepository.getAllUser();
        res.status(200).send(users)
    }

    async loginUser(req, res){
        const requestBody = req.body
        const user = await this.userRepository.getUserByCredential(requestBody.email, requestBody.password)
        if(user == null) res.send("user not found")
        res.send(user)
    }
}

module.exports = UserController