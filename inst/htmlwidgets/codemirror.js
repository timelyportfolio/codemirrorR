HTMLWidgets.widget({

  name: 'codemirror',

  type: 'output',

  factory: function(el, width, height) {

    return {
      
      editor : {},
      
      renderValue: function(x) {
        
        var editor = CodeMirror(el, x);
        
        this.editor = editor;
        
      },
      
      resize: function(width, height) {

      }
      
    };

  }
});