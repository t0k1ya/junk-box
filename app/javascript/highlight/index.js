import hljs from 'highlight.js/lib/highlight'
import 'highlight.js/styles/gruvbox-dark.css'

// hljs.registerLanguage('ruby', require('highlight.js/lib/languages/ruby'));
// hljs.registerLanguage('erb', require('highlight.js/lib/languages/erb'));
// hljs.registerLanguage('bash', require('highlight.js/lib/languages/bash'));
// hljs.registerLanguage('javascript', require('highlight.js/lib/languages/javascript'));

// import ruby from 'highlight.js/lib/languages/ruby'
// hljs.registerLanguage('ruby', ruby);

// import erb from 'highlight.js/lib/languages/erb'
// hljs.registerLanguage('erb', erb);

// import bash from 'highlight.js/lib/languages/bash'
// hljs.registerLanguage('bash', bash);

// import javascript from 'highlight.js/lib/languages/javascript'
// hljs.registerLanguage('javascript', javascript);

hljs.configure({ languages: ['ruby', 'erb', 'bash', 'javascript'] })
document.addEventListener('turbolinks:load', (event) => {
  document.querySelectorAll('pre').forEach((block) => {
    hljs.highlightBlock(block)
  })
})