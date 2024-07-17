const UserRepository = require("../repository/user-repository")

class UserController {
    static instance = null
    userRepository

    constructor() {
        this.userRepository = UserRepository.getInstance()

        this.getAllUser = this.getAllUser.bind(this)
    }

    static getInstance() {
        if(this.instance == null) this.instance = new UserController()
        return this.instance
    }

    async getAllUser(req, res){
        console.log(this.userRepository)
        const users = await this.userRepository.getAllUser();
        res.status(200).send(users[0])
    }
}

module.exports = UserController