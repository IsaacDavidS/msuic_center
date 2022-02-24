
const db = require("../database/models");
const { Op } = require("sequelize");


const toThousand = (n) => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

const mainController = {
  index: (req, res) => {
    ;
    db.Producto
      .findAll({
        include: ['categoria'],
        where: {
          isRecommended: 1,
        },
        limit: 9,
        order: [["updated_at", "DESC"]],
      })
      .then((products) => {
        res.render("index", {
          products,
          toThousand,
          user: req.loggedUser,
        });
      })
      .catch((error) => {
        res.render("notFound", { error: "No se pudieron cargar los productos" });
      }
      );
  },
  about: (req, res) => {
    res.render("about", { user: req.loggedUser });
  },
}


module.exports = mainController;
