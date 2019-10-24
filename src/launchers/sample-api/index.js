const express = require('express')
const app = express()
const model = require('integrations/sequelize/models')

app.get('/', async (req, res) => {
  const obj = { msg: `Hello World! tenancy ${process.env.TENANCY} HOSTNAME: ${process.env.HOSTNAME}` }
  obj.data = await model.Tenancy.findAll()
  res.send(obj)
})

app.listen(process.env.PORT, function () {
  console.log(`Example app listening on port ${process.env.PORT}!`)
})
