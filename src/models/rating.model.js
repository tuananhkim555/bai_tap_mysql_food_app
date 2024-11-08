// Model cho chức năng đánh giá nhà hàng
module.exports = (sequelize, DataTypes) => {
  const Rating = sequelize.define("Rating", {
    rate_id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    users_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    foods_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    amount: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    date_rate: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    }
  }, {
    tableName: 'rate_res',
    timestamps: false
  });

  return Rating;
};
