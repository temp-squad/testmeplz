import { Controller } from "@hotwired/stimulus"
import CodeMirror from "codemirror"
import "codemirror/mode/ruby/ruby.js"
import "codemirror/mode/javascript/javascript.js"
import "codemirror/lib/codemirror.css"

import { debounce } from "lodash/fp"

// Connects to data-controller="code-editor"

let codeEditor

export default class extends Controller {
  static targets = ["form", "status"]
  
  setCodeEditorHeight() {
    codeEditor.setSize(null, this.formTarget.offsetHeight)
  }

  connect() {
    codeEditor = CodeMirror.fromTextArea(document.getElementById("code-editor"), {
      lineNumbers: true,
      mode: "javascript",
      tabSize: 2,
    });
    
    codeEditor.on('change', (instance, changeObject) => {
      this.statusTarget.innerText = "Saving..."
      this.formTarget.requestSubmit()
    })

    this.setCodeEditorHeight()
  }
}
