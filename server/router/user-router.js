const UserController = require("../controllers/user-controller")

class UserRouter {
    app
    userController
    constructor(app){ 
        this.app = app
        this.userController = UserController.getInstance()
        this.init()
    }

    init () {
        this.app.get('/user', this.userController.getAllUser)
        this.app.get('/user/:id', this.userController.getUser)
        this.app.post('/user', this.userController.loginUser)
        this.app.post('/user/create', this.userController.createUser)
    }
}

module.exports = UserRouter