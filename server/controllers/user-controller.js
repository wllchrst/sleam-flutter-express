const { v4 } = require("uuid")
const UserRepository = require("../repository/user-repository")

class UserController {
    static instance = null
    userRepository

    constructor() {
        this.userRepository = UserRepository.getInstance()

        this.getAllUser = this.getAllUser.bind(this)
        this.loginUser = this.loginUser.bind(this)
        this.createUser = this.createUser.bind(this)
        this.getUser = this.getUser.bind(this)
    }

    static getInstance() {
        if(this.instance == null) this.instance = new UserController()
        return this.instance
    }

    async getAllUser(req, res){
        const users = await this.userRepository.getAllUser();
        console.log('finding users')
        res.status(200).send(users)
    }

    async getUser(req, res){
        const id = req.params.id
        const user = await this.userRepository.getUserById(id);
        if(user.length <= 0 || user == null) res.status(404).send("User Not Found");
        res.status(200).send(user[0]);
    }

    async loginUser(req, res){
        const requestBody = req.body
        const user = await this.userRepository.getUserByCredential(requestBody.email, requestBody.password)
        console.log(user)
        if(user == null || user.length <= 0) res.send("user not found")
        res.status(200).send(user[0])
    }

    async createUser(req, res){
        try {
            const requestBody = req.body
            const id = v4()
            this.userRepository.createUser(id, requestBody.email, requestBody.password);   
            res.status(200).send('gacor')
        } catch (error) {
            console.log(error)
            res.status(404).send('Something went wrong')
        }
    }
}

module.exports = UserController