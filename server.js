const express = require('express');
const fs = require('fs');
const csv = require('csv-parser');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

let users = [];

// Read the CSV file and store the users in an array
fs.createReadStream('users.csv')
    .pipe(csv())
    .on('data', (row) => {
        users.push(row);
    })
    .on('end', () => {
        console.log('CSV file successfully processed');
    });

app.post('/validate-login', (req, res) => {
    const { username, password } = req.body;
    const user = users.find(u => u.username === username && u.password === password);
    if (user) {
        res.json({ valid: true });
    } else {
        res.json({ valid: false });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
