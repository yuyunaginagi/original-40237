document.addEventListener('turbo:load', () => {
  document.querySelectorAll('.delete-link').forEach(link => {
    link.addEventListener('click', (event) => {
      if (!confirm(link.getAttribute('data-confirm'))) {
        event.preventDefault();
      }
    });
  });
});