const { Sequelize } = require('sequelize');
const config = require('../config/config');

// Khởi tạo kết nối database
const sequelize = new Sequelize(
  config.database,
  config.username,
  config.password,
  {
    host: config.host,
    port: config.port,
    dialect: config.dialect
  }
);

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;

// Import các model
db.Like = require('./like.model')(sequelize, Sequelize);
db.Rating = require('./rating.model')(sequelize, Sequelize);

module.exports = db;
