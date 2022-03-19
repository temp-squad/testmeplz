import { Controller } from "@hotwired/stimulus"
import CodeMirror from "codemirror"
import "codemirror/mode/ruby/ruby.js"
import "codemirror/mode/javascript/javascript.js"
import "codemirror/lib/codemirror.css"

let codeEditor

export default class extends Controller {
  static targets = ["form", "output", "languageSwitcher", "languageForm", "answerLanguage"]
  
  switchLanguage(event) {
    const language = event.target.value
    codeEditor.setOption("mode", language)
    this.answerLanguageTarget.value = language
    this.languageFormTarget.requestSubmit()
  }

  connect() {
    codeEditor = CodeMirror.fromTextArea(document.getElementById("code-editor-canvas"), {
      lineNumbers: true,
      mode: this.answerLanguageTarget.value,
      tabSize: 2,
    });
    
    codeEditor.on('change', (instance, changeObject) => {
      document.getElementById("code-editor-status").innerText = "Saving..."
      this.formTarget.requestSubmit()
    })

    codeEditor.setSize(null, "100%")
  }
}
