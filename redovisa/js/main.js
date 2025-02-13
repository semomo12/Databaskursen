(function IIFE() {
    "use strict";

    setTimeout(outputGreeting, 2000);

    outputGreeting(9);
})();

function outputGreeting(hours=new Date().getHours()) {
    let greetingElement = document.getElementById("greeting");

    if (greetingElement) {
        let greeting = "Gonatt";

        if (hours > 6 && hours <= 10) {
            greeting = "Gomorgon";
        } else if (hours > 10 && hours <= 16) {
            greeting = "Goddag";
        } else if (hours > 16 && hours <= 22) {
            greeting = "Gokväll";
        }
        greetingElement.textContent = greeting;
    }
}
