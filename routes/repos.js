const express = require('express');
const router = express.Router();
const fetch = require('node-fetch');
const redis = require('redis');
const randomInt = require('random-int');


const REDIS_PORT = process.env.PORT || 6379;

const client = redis.createClient(REDIS_PORT);

async function getRepos(req, res, next){
    try {
        console.log('Fetching data...');
        const username = req.body.username;
        const response = await fetch(`https://api.github.com/users/${username}`);
        const data = await response.json();
        const repos = data.public_repos;
        //send data to redis
        client.setex(username, randomInt(3600, 4200), repos);
        res.render('repos', {repos_result: repos});
    } catch (err){
        console.error(err);
        res.status(500);
    }
}

//cache middleware
function cache(req, res, next){
    const username = req.body.username
    client.get(username, (err, data) =>{
        if(err) throw err;

        if(data !== null){
            res.render('repos', {repos_result: data});

        }else{
            next();
        }
    })
}

router.post('/', cache, getRepos);
router.get('/', (req, res, next) => {
    res.render('repos');
});

router.get('')

module.exports = router;
