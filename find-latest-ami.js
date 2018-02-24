const AWS=require('aws-sdk')

const ec2 = new AWS.EC2({region: 'ap-northeast-1', apiVersion: '2016-11-15'***REMOVED***)

let regionAMIMap={***REMOVED***

function getRegions(cb) {
	let params = {***REMOVED***;
	ec2.describeRegions(params, function(err, data) {
	  if (err) console.log(err, err.stack); // an error occurred
		else {
			let regions=data.Regions.map(x => x.RegionName)
			cb(regions)
	  ***REMOVED***
	***REMOVED***)
***REMOVED***

//console.log("Regions: ")
//getRegions((x) => console.log(x))


function getRegionsPromise() {
	return new Promise(function(resolve, reject) {
		let params = {***REMOVED***;
		ec2.describeRegions(params).promise()
		  .catch((err) => {
		  	reject(err)
		  ***REMOVED***)
		  .then((data) => {
				let regions=data.Regions.map(x => x.RegionName)
				resolve(regions)
		  ***REMOVED***)
	***REMOVED***)
***REMOVED***

//console.log("With Promises2: ")
//getRegionsPromise().then((x) => console.log(x))

function getImageForRegion(region, name) {
	var params = {
		ExecutableUsers: [ 'all' ],
	  DryRun: false,
	  Filters: [
	    {
	      Name: 'name',
	      Values: [
	        name,
	    ***REMOVED***,
	     ***REMOVED***,
	     {
	     	Name: 'state',
	     	Values: [
	     		'available'
	     	]
	     ***REMOVED***
	***REMOVED***,
	  Owners: [
	    'amazon',
	***REMOVED***
	***REMOVED***;
	const ec2 = new AWS.EC2({region: region, apiVersion: '2016-11-15'***REMOVED***)

	return new Promise(function(resolve, reject) {
		ec2.describeImages(params).promise()
			.catch((err) => {
				reject(err)
			***REMOVED***)
			.then((data) => {
				let images=data.Images.sort((a,b) => {
					if (a.CreationDate > b.CreationDate) return -1
					if (a.CreationDate == b.CreationDate) return 0
					return 1
				***REMOVED***)
				resolve({Region: region, Name: images[0].ImageId***REMOVED***)
			***REMOVED***);	
		***REMOVED***)
***REMOVED***

//getImageForRegion('ap-northeast-1', 'amzn2-ami-hvm-*-x86_64-gp2').then((data) => console.log('Latest Amazon Linux 2 image is ', data)).catch((err) => console.log("ERROR: ", err))

function listLatestAMIForRegions(amiName) {
	return new Promise((resolve, reject) => {
		getRegionsPromise()
		.then((regions) => {
			// regions=regions.filter((x) => x.substr(0,3)=='ap-')
			// console.log('Regions=', regions)
			let regionAMIMap=regions.map((region) =>  { return getImageForRegion(region, 	amiName)***REMOVED***)
			Promise.all(regionAMIMap).then((x) => resolve(x))
		***REMOVED***)
		.catch((err) => reject(err))
	***REMOVED***)
***REMOVED***

listLatestAMIForRegions('amzn2-ami-hvm-*-x86_64-gp2').then((x) => console.log("Region-AMI-Map for Amazon Linux 2 Image:\n", x))

