
// const fs = require('fs');
// const path = require('path');
const db = require('../database/models');



function checkLoginMid(req, res, next) {
    if (req.session.user) {
        db.Usuario
        .findOne({
            where: {
                email: req.session.user
            }
        })
        .then(user => {
            if (user != undefined) {
                next();
            } else {
                res.redirect('/users/login');
            }
        })
        .catch(error => {
            res.send(error);
        }); 
    } else {
        res.redirect('/users/login');
    }
    
    
}

module.exports = checkLoginMid;

