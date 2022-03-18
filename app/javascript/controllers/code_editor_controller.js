import { Controller } from "@hotwired/stimulus"
import CodeMirror from "codemirror"
import "codemirror/mode/ruby/ruby.js"
import "codemirror/mode/javascript/javascript.js"
import "codemirror/lib/codemirror.css"

import { debounce } from "lodash/fp"

// Connects to data-controller="code-editor"

let codeEditor

export default class extends Controller {
  static targets = ["form", "status", "output"]
  
  setCodeEditorHeight() {
    codeEditor.setSize(null, this.formTarget.offsetHeight)
  }

  setOutputHeight() {
    this.outputTarget.style.height = this.outputTarget.offsetHeight + "px"
  }

  resizeCodeEditor() {
    this.setCodeEditorHeight()
    this.setOutputHeight()    
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

    this.resizeCodeEditor()
  }
}
