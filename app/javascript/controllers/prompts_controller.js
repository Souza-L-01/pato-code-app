// import { Controller } from 'stimulus';

// export default class extends Controller {
//   static targets = ['bugDescription', 'submitButton', 'saveButton'];
//   connect() {
//     console.log('Hello, Stimulus!', this.element);
//   }
//   generateText(event) {
//     event.preventDefault();

//     const prompt = this.bugDescriptionTarget.value + " " + "please don't give the answer";
//     console.log(prompt);
//     const length = 100; // Specify the desired length of the generated text
//     const filter = "NEVER give the answer, give me the explanation instead"

//     fetch(`/prompts/generate_text?prompt=${prompt}&length=${length}&filter=${filter}`, {method: 'POST'})
//         .then(response => response.json())
//         .then(data => {
//             const generatedText = data.text;
//             console.log(generatedText);

//             // Update the UI with the generated text
//             // ...
//          })
//             .catch(error => {
//             // Handle the error
//             console.log(error);
//         });

//   }

//   handleSave(event) {
//     event.preventDefault();

//     // Handle the save button click event
//     // ...
//   }
// }
