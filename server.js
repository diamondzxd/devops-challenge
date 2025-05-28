const http = require('http');

const server = http.createServer((req, res) => {
    if (req.url === '/' && req.method === 'GET') {
        const timestamp = new Date().toISOString();
        const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress;
        // x-forwarded-for fetches the original IP if behind a proxy

        const response = {
            timestamp: timestamp,
            ip: ip
        };

        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify(response));
    } else {
        res.writeHead(404, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ error: 'Not Found' }));
    }
});

const PORT = 8080;
server.listen(PORT, () => {
    console.log(`SimpleTimeService running at http://localhost:${PORT}`);
});

// Handle graceful shutdown on process termination signals
process.on('SIGINT', () => {
    console.log('\nShutting down server (SIGINT)...');
    server.close(() => {
        console.log('Server closed. Exiting process.');
        process.exit(0);
    });
});

process.on('SIGTERM', () => {
    console.log('\nShutting down server (SIGTERM)...');
    server.close(() => {
        console.log('Server closed. Exiting process.');
        process.exit(0);
    });
});