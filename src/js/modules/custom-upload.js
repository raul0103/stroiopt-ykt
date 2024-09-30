export default function initCustomUpload() {
  document
    .querySelector("[data-custom-upload-input]")
    .addEventListener("change", function () {
      const fileName = this.files[0] ? this.files[0].name : "Файл не выбран";
      let file_name_elem = document.querySelector(
        "[data-custom-upload-file-name]"
      );

      file_name_elem.style.display = "block";
      file_name_elem.textContent = fileName;
    });
}
