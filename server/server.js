require('dotenv').config()
const express = require('express');
const UserRouter = require('./router/user-router');
const GameRouter = require('./router/game-router');
const app = express();
const PORT = process.env.PORT

// Middleware
app.use(express.json()); // For parsing application/json

// Routing
new UserRouter(app)
new GameRouter(app)

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});