import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['bugDescription', 'submitButton', 'saveButton'];

  connect() {
    this.submitButtonTarget.addEventListener('click', this.generateText.bind(this));
    this.saveButtonTarget.addEventListener('click', this.handleSave.bind(this));
  }

  generateText(event) {
    event.preventDefault();

    const prompt = this.bugDescriptionTarget.value;
    const length = 100; // Specify the desired length of the generated text

    fetch(`/api/prompts/generate_text?prompt=${prompt}&length=${length}`)
        .then(response => response.json())
        .then(data => {
            const generatedText = data.text;

            // Update the UI with the generated text
            // ...
         })
            .catch(error => {
            // Handle the error
            console.log(error);
        });

  }

  handleSave(event) {
    event.preventDefault();

    // Handle the save button click event
    // ...
  }
}
