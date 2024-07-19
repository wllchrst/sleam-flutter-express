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
        this.app.post('/user', this.userController.loginUser)
    }
}

module.exports = UserRouter