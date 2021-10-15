// use readline to read from input
const readline = require('readline');
const fs = require('fs');
const crypto = require('crypto');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});

rl.on('line', (line) => {

    const [id, file] = line.split(', ');

    let content = fs.readFileSync(file).toString();
    
    content = content.replace(id, () => `'${crypto.randomUUID()}'`);

    fs.writeFileSync(file, content);
});