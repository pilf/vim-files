#!/usr/bin/env node

var program = require('commander');
var querystring = require('querystring');

program  
  .version('1.0.0')
  .option('-e, --encode', 'Encode piped input')
  .option('-d, --decode', 'Decode piped input')
  .parse(process.argv);

function unescape_others(str) {
 return String(str)
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, '\'')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
}

process.stdin.resume();  
process.stdin.setEncoding('utf8');  
process.stdin.on('data', function(data) {  
  if(program.encode) {
    process.stdout.write(querystring.escape(data));
  } else {
    process.stdout.write(unescape_others(querystring.unescape(data)));
  }
});
