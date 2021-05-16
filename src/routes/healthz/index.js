const router = require('express').Router();
const fs = require('fs');
let route;
fs.readdirSync(__dirname).forEach(route => {
  const [routeVal] = route.split('.');
  if (routeVal === 'index' || routeVal === 'docs') return ;
  route = router.use(require(`./${routeVal}.js`));
 
});
module.exports = router;