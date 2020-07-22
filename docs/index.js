let textarea = document.getElementById("textarea");
let output = document.getElementById("output");
let execute = document.getElementById("execute");
let editor = CodeMirror.fromTextArea(textarea, {
    lineNumbers: true,
    styleActiveLine: true,
    matchBrackets: true,
    theme: "blackboard"
});

function run(){
    let text = editor.getValue();
    //alert(text);
};

execute.addEventListener("click",run, false);