const fastify = require('fastify')()
const path = require('node:path')
const fs = require('fs');

fastify.register(require('@fastify/postgres'), {
  connectionString: 'postgres://app_user@localhost/ecom'
})

//To Serve Static 
fastify.register(require('@fastify/static'), {
  root: path.join(__dirname, 'public')
  // prefix: '/public/', // optional: default '/'
  // constraints: { host: 'example.com' } // optional: default {}
})

fastify.get('/user', function (req, reply) {
  fastify.pg.query(
    'select * from ecom_user;',
    //'SELECT id, username, hash, salt FROM users WHERE id=$1', [req.params.id],
    function onResult(err, result) {
      reply.send(err || result)
    }
  )
})

//Register Service
fastify.post('/user/:username/:password', (req, reply) => {
  // will return a promise, fastify will send the result automatically
  return fastify.pg.transact(async client => {
    // will resolve to an id, or reject with an error
    const id = await client.query('INSERT INTO ecom_user(id,password) VALUES($1,$2) RETURNING id', [req.params.username, req.params.password])

    // Refresh the Cache

    return id;
  })
})

//Login Service 
fastify.post('/login/:username/:password', (req, reply) => {

  var obj = JSON.parse(fs.readFileSync('user_cache.json', 'utf8'));
  if (obj.filter(x => x.id == req.username).length == 1) {
    const userobk = obj.filter(x => x.id == req.username)[0];
    if (userobk.password == req.password) {
      return "Authenticated";
    }
    else {
      return "Passworf Not Correct";
    }
  }
  else if (obj.filter(x => x.id == req.username).length == 0) {
    return "User Not Found";
  }

});

//Example Static
fastify.get('/another/path', function (req, reply) {
  reply.sendFile('myHtml.html') // serving path.join(__dirname, 'public', 'myHtml.html') directly
})

fastify.listen({ port: 4000 }, err => {
  //Load User Cache In Mem or file
  fastify.pg.transact(async client => {
    // will resolve to an id, or reject with an error
    const result = await client.query('SELECT id,password FROM ecom_user');
    //Save in Cache file
    fs.writeFileSync("user_cache.json", result);

  });

  if (err) throw err
  console.log(`server listening on ${fastify.server.address().port}`)
})