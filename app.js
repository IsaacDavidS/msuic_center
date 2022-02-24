const express = require("express");
const path = require("path");
const methodOverride = require("method-override");
const app = express();
const session = require('express-session');
const cookieParser = require('cookie-parser');

const usersRouter = require("./src/routes/usersRouter");
const productsRouter = require("./src/routes/productsRouter");
const mainRouter = require("./src/routes/mainRouter");
const apiProductsRouter = require("./src/routes/apiProductsRouter");
const apiUsersRouter = require("./src/routes/apiUsersRouter");
const logMiddleware = require('./src/middlewares/logMid');
const rememberMiddleware = require('./src/middlewares/rememberMid');

const PUERTO = 3080;

const publicPath = path.resolve(__dirname, "./public");


app.use(express.static(publicPath));

app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.json());
app.use(methodOverride("_method"));
app.use(session({ secret: "Musica", resave: false, saveUninitialized: false }));

app.use(rememberMiddleware);
app.use(logMiddleware);


app.use("/users", usersRouter);
app.use("/products", productsRouter);
app.use("/api/users", apiUsersRouter);
app.use("/api/products", apiProductsRouter);
app.use("/", mainRouter);


app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "./src/views"));



app.listen(PUERTO, () => {
  console.log(`Servidor corriendo en ${PUERTO}`);
});