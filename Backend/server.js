const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3002;

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'school'
});

db.connect(err => {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    return;
  }
  console.log('Connected to database.');
});

// Login endpoint
app.post('/login', (req, res) => {
  const { email, password } = req.body;
  const query = 'SELECT * FROM 1styearstudent WHERE email = ? AND password = ?';
  db.query(query, [email, password], (err, results) => {
    if (err) {
      res.status(500).send('Server error');
    } else if (results.length > 0) {
      // Assuming 1styearstudent table has a unique student ID (adjust as per your database schema)
      const studentId = results[0].Student_ID; // Retrieve student ID from query results
      res.status(200).json({ studentId }); // Return student ID in JSON response
    } else {
      res.status(401).send('Invalid credentials');
    }
  });
});

// Grades endpoint
app.get('/api/grades', (req, res) => {
  const studentId = req.query.student_id;
  if (!studentId) {
    return res.status(400).json({ error: 'Student ID parameter is required' });
  }

  const query = 'SELECT * FROM 1styearstudentgrades WHERE Student_ID = ?';
  db.query(query, [studentId], (err, results) => {
    if (err) {
      console.error('Error fetching grades:', err); // Log the detailed error
      return res.status(500).send('Server error'); // Send generic error response
    }

    if (results.length === 0) {
      return res.status(404).json({ error: 'No grades found for the given student ID' });
    }

    // Prepare response in JSON format
    const grades = results.map(result => ({
      ID: result.ID,
      CPE111: result.CPE111,
      PHY121: result.PHY121,
      CPE112: result.CPE112,
      GECS01: result.GECS01,
      GECS02: result.GECS02,
      GECS03: result.GECS03,
      GECS04: result.GECS04,
      PE1: result.PE1,
      NSTP1: result.NSTP1,
      Grade: result.Grade
    }));

    res.status(200).json(grades);
  });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
