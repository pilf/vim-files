#!/usr/bin/env node

var program = require('commander');
var querystring = require('querystring');

program  
  .version('1.0.0')
  .option('-e, --encode', 'Encode piped input')
  .option('-d, --decode', 'Decode piped input')
  .parse(process.argv);

process.stdin.resume();  
process.stdin.setEncoding('utf8');  
process.stdin.on('data', function(data) {  
  if(program.encode) {
    process.stdout.write(querystring.escape(data));
  } else {
    process.stdout.write(querystring.unescape(data));
  }
});
