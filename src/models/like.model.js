// Model cho chức năng like nhà hàng
module.exports = (sequelize, DataTypes) => {
  const Like = sequelize.define("Like", {
    like_id: {
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
    date_like: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    }
  }, {
    tableName: 'like_res',
    timestamps: false
  });

  return Like;
};
