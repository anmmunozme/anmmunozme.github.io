//listeners
document.addEventListener('DOMContentLoaded', function () {
	document.querySelector('#police_check').addEventListener('change', policeHandler);
	document.querySelector('#park_check').addEventListener('change', parkHandler);
	document.querySelector('#fire_check').addEventListener('change', fireHandler);
	document.querySelector('#hospital_check').addEventListener('change', hospitalHandler);
	document.querySelector('#crime_check').addEventListener('change', crimeHandler);

});
