(function () {
  function init() {
    var forms = document.querySelectorAll('form[data-inquiry-form]');
    forms.forEach(function (form) {
      form.addEventListener('submit', function (e) {
        e.preventDefault();

        var submitBtn = form.querySelector('button[type="submit"]');
        var originalText = submitBtn ? submitBtn.textContent : '';
        if (submitBtn) {
          submitBtn.disabled = true;
          submitBtn.textContent = form.dataset.sendingText || 'Sending...';
        }

        var fd = new FormData(form);
        var payload = {};
        fd.forEach(function (value, key) {
          payload[key] = value;
        });

        fetch(form.action, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: JSON.stringify(payload)
        })
          .then(function (res) {
            if (res.ok) {
              window.location.href = form.dataset.thanksUrl || '/thanks/';
              return;
            }
            return res.json().catch(function () { return {}; }).then(function () {
              throw new Error('submission failed');
            });
          })
          .catch(function () {
            alert(form.dataset.errorText || 'Submission failed. Please try again.');
            if (submitBtn) {
              submitBtn.disabled = false;
              submitBtn.textContent = originalText;
            }
          });
      });
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
