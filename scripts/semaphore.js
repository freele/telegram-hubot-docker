let semaphoreRoom;

module.exports = function (robot) {
  robot.hear(/semaphore/i, (res) => {
  	// res.send('KEYS', Object.keys(res));
  	// res.send('messsage', JSON.stringify(res.messsage, null, 4));
    semaphoreRoom = res.envelope.message.room;
    res.send(`Room subscribed to semaphore updates: ${semaphoreRoom}`);
  });

  robot.router.post('/api/semaphore', (req, res) => {
    res.send(`Router works!\n ${Object.keys(req.body)}`);
    if (semaphoreRoom) {
    	robot.messageRoom(semaphoreRoom, `${JSON.stringify({ RESULT: req.body.result, info: req.body }, null, 4)}`);
    }
  });

};

