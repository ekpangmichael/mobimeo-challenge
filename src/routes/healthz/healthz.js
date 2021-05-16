const router = require('express').Router();
const { healthz } = require('../../services/healthz');
const { handleResponse } = require('../../helpers/responseHandler');

router.get('/', async (req, res) => {
  const data = await healthz();
	handleResponse(data, res, req.method, req.originalUrl);
});

module.exports = router;
