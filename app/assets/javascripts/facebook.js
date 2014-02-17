// http://stackoverflow.com/questions/7131909/facebook-callback-appends-to-return-url
$(document).ready(function() {
  if (window.location.hash == "#_=_") {
    window.location.hash = ''; // remove hash, leaving '#'
    history.pushState('', document.title, window.location.pathname); // push clean URL
    event.preventDefault(); // no page reload
  }
})
