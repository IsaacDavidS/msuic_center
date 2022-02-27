// const path = require('path');
// const fs = require('fs');
const db = require('../database/models');


function rememberMid(req, res, next) {
   
    if (req.cookies.user !== undefined && req.session.user == undefined) {
        db.Usuario
            .findOne({
                where: {
                    email: req.cookies.user
                }
            })
            .then(user => {
                if (user != undefined) {
                    req.session.user = user.email;
                    req.loggedUser = user;
                }
                next();
            })
            .catch(error => {
                res.send(error);
            });
        
    } else if (req.session.user != undefined) {
        db.Usuario
            .findOne({
                where: {
                    email: req.session.user
                }
            })
            .then(user => {
                if (user != undefined) {
                    req.loggedUser = user;
                }
                next();
            })
            .catch(error => {
                res.send(error);
            });
       

    } else {
        next();
    }
}
module.exports = rememberMid;