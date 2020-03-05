module.exports =
/******/ (function(modules, runtime) { // webpackBootstrap
/******/ 	"use strict";
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	__webpack_require__.ab = __dirname + "/";
/******/
/******/ 	// the startup function
/******/ 	function startup() {
/******/ 		// Load entry module and return exports
/******/ 		return __webpack_require__(104);
/******/ 	};
/******/
/******/ 	// run startup
/******/ 	return startup();
/******/ })
/************************************************************************/
/******/ ({

/***/ 104:
/***/ (function(__unusedmodule, __unusedexports, __webpack_require__) {

const spawn = __webpack_require__(129).spawn;
const path = __webpack_require__(622);

const exec = (cmd, args=[]) => new Promise((resolve, reject) => {
  console.log(`Started: ${cmd} ${args.join(" ")}`);
  const app = spawn(cmd, args, { stdio: 'inherit' });
  app.on('close', code => {
    if (code !== 0) {
      const err = new Error(`Invalid status code: ${code}`);
      err.code = code;
      return reject(err);
    }
    return resolve(code);
  });
  app.on('error', reject);
});

const main = async () => {
  await exec('bash', [path.join(__dirname, './action.sh')]);
};

main().catch(err => {
  console.error(err);
  console.error(err.stack);
  process.exit(err.code || -1);
});


/***/ }),

/***/ 129:
/***/ (function(module) {

module.exports = require("child_process");

/***/ }),

/***/ 622:
/***/ (function(module) {

module.exports = require("path");

/***/ })

/******/ });