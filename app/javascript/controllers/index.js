// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

// country //

const countryGuess = document.querySelector(".country-guess");
const countryName = document.querySelector(".country-name");
const guessValue = document.getElementById("country-guess");

function revealCountryName(event) {
  event.preventDefault();
  countryName.classList.remove("d-none");
  countryGuess.classList.add("d-none");

  if (guessValue.value.toLowerCase() === countryName.innerHTML.toLowerCase()) {
    countryName.classList.add("correct-guess")
  }  else {
    countryName.classList.add("incorrect-guess")
  }
}

countryGuess.addEventListener("submit", revealCountryName);

// capital //

const capitalGuess = document.querySelector(".capital-guess");
const capitalName = document.querySelector(".capital-name");
const capitalGuessValue = document.getElementById("capital-guess");

function revealCapitalName(event) {
  event.preventDefault();
  capitalName.classList.remove("d-none");
  capitalGuess.classList.add("d-none");
  if (capitalGuessValue.value.toLowerCase() === capitalName.innerHTML.slice(10, capitalName.innerHTML.length - 1).toLowerCase()) {
    capitalName.classList.add("correct-guess")
  } else {
    capitalName.classList.add("incorrect-guess")
  }
}

capitalGuess.addEventListener("submit", revealCapitalName);


// population //
const populationGuess = document.querySelector(".population-guess");
const population = document.querySelector(".population");
const popGuessValue = document.getElementById("population-guess");

function revealPopulation(event) {
  event.preventDefault();
  population.classList.remove("d-none");
  populationGuess.classList.add("d-none");

  const guess = Number.parseInt(popGuessValue.value);
  const actual = Number.parseInt(population.innerHTML.slice(13).replace(/,/g, ''));
  const margin = actual * 0.2;

  if ( Math.abs(actual - guess) < margin ) {
    population.classList.add("correct-guess");
  } else {
    population.classList.add("incorrect-guess");
  }
}

populationGuess.addEventListener("submit", revealPopulation);
