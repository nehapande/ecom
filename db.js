const fastify = require('fastify')()

fastify.register(require('@fastify/postgres'), {
  connectionString: 'postgres://app_user@localhost/ecom'
})

fastify.get('/user', function (req, reply) {
  fastify.pg.query(
    'select * from ecom_user;',
    //'SELECT id, username, hash, salt FROM users WHERE id=$1', [req.params.id],
    function onResult (err, result) {
      reply.send(err || result)
    }
  )
})

fastify.post('/user/:username/:password', (req, reply) => {
    // will return a promise, fastify will send the result automatically
    return fastify.pg.transact(async client => {
      // will resolve to an id, or reject with an error
      const id = await client.query('INSERT INTO ecom_user(id,password) VALUES($1,$2) RETURNING id', [req.params.username,req.params.password])
  
      // potentially do something with id
  
      return id
    })
  })

fastify.listen({ port: 4000 }, err => {
  if (err) throw err
  console.log(`server listening on ${fastify.server.address().port}`)
})