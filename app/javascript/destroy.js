document.addEventListener("DOMContentLoaded", function() {
  const deleteLinks = document.querySelectorAll(".review_destroy a[data-turbo-method='delete'], .destroy a[data-turbo-method='delete']");

  deleteLinks.forEach(function(link) {
    link.addEventListener("click", function(event) {
      const message = link.getAttribute("data-confirm");
      if (message && !confirm(message)) {
        event.preventDefault(); // リンクのデフォルトの動作をキャンセル
      }
    });
  });
});