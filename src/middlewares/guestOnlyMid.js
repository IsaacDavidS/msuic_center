// const fs = require('fs');
// const path = require('path');
const db = require('../database/models');


function guestOnlyMid(req, res, next) {
    
    if (req.session.user != undefined) {
        db.Usuario
            .findOne({
                where: {
                    email: req.session.user
                }
            })
            .then(user => {
                if (user == undefined) {
                    next();
                } else {
                    res.redirect('/');
                }
            })

    } else {
        next();
    }
}

module.exports = guestOnlyMid;

