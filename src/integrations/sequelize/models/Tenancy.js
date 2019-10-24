module.exports = (sequelize, DataTypes) => {
  const _model = sequelize.define('Tenancy', {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    }
  }, {
    schema: process.env.TENANCY,
    paranoid: true,
    tableName: 'tenancy'
  })

  return _model
}
