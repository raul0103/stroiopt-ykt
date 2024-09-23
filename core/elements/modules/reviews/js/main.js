const MltReviewAjaxForm = {
  elem_attr: {
    form_id: "review-form",
    error_message: "data-error-message",
  },
  elems: {
    form: null,
  },
  init: () => {
    MltReviewAjaxForm.elems.form = document.getElementById(
      MltReviewAjaxForm.elem_attr.form_id
    );
    if (!MltReviewAjaxForm.elems.form) {
      console.warn("Форма для отзыва не найдена");
      return;
    }
    MltReviewAjaxForm.formListener();
  },
  formListener: () => {
    MltReviewAjaxForm.elems.form.addEventListener("submit", (event) => {
      event.preventDefault();

      MltReviewAjaxForm.elems.form.classList.add("loading");

      let action = MltReviewAjaxForm.elems.form.action;
      let form_data = new FormData(MltReviewAjaxForm.elems.form);

      let xhr = new XMLHttpRequest();
      xhr.open("POST", action, true);

      xhr.onload = () => {
        let data = JSON.parse(xhr.responseText);

        if (data.success) {
          console.log("true", data);
          MltReviewAjaxForm.successHandler();
        } else {
          console.log("false", data);
          MltReviewAjaxForm.errorHandler(data.object);
        }

        MltReviewAjaxForm.elems.form.classList.remove("loading");
      };

      xhr.onerror = () => {
        console.error("Ошибка запроса");
      };

      xhr.send(form_data);
    });
  },
  successHandler: () => {
    let modal = document.getElementById("modal-review");
    if (!modal) return;
    modal.querySelector("[data-modal-body-after]")?.classList.add("show");
    modal.querySelector("[data-modal-body-before]")?.classList.add("hide");
  },
  errorHandler: (errors) => {
    MltReviewAjaxForm.elems.form
      .querySelectorAll(`[${MltReviewAjaxForm.elem_attr.error_message}].show`)
      .forEach((show_error_elem) => {
        show_error_elem.classList.remove("show");
        show_error_elem.textContent = "";
      });
    MltReviewAjaxForm.elems.form
      .querySelectorAll(`[name]`)
      .forEach((show_error_elem) => {
        show_error_elem.classList.remove("is-error");
      });

    errors.forEach((error) => {
      let error_message_elem = MltReviewAjaxForm.elems.form.querySelector(
        `[${MltReviewAjaxForm.elem_attr.error_message}="${error.field}"]`
      );
      if (error_message_elem) {
        error_message_elem.classList.add("show");
        error_message_elem.textContent = error.message;
      }

      let field = MltReviewAjaxForm.elems.form.querySelector(
        `[name="${error.field}"]`
      );
      if (field) {
        field.classList.add("is-error");
      }
    });
  },
};

export default MltReviewAjaxForm;
