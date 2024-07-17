require('dotenv').config()
const express = require('express');
const UserController = require('./controllers/user-controller');
const UserRepository = require('./repository/user-repository');
const app = express();
const PORT = process.env.PORT

const userController = UserController.getInstance() 

// Middleware
app.use(express.json()); // For parsing application/json

// Routes
app.get('/', userController.getAllUser);
// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

