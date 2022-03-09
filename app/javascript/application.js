// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import CodeMirror from "codemirror"
import "codemirror/mode/ruby/ruby.js"
import "codemirror/lib/codemirror.css"
// import "codemirror.css"
// import "codemirror/mode"

const codeEditor = CodeMirror.fromTextArea(document.getElementById("code-editor"), {
  lineNumbers: true,
  mode: "ruby",
  tabSize: 2,
});

const codeEditorWrapper = codeEditor.display.wrapper
codeEditorWrapper.classList.add("border", "rounded-md", "mb-4");
