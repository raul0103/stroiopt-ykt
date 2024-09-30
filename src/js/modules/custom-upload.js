export default function initCustomUpload() {
  const limit_size = 1024 * 1024 * 5; // 5 MB

  document
    .querySelector("[data-custom-upload-input]")
    .addEventListener("change", function () {
      const fileName = this.files[0] ? this.files[0].name : "Файл не выбран";
      let file_name_elem = document.querySelector(
        "[data-custom-upload-file-name]"
      );

      if (this.files[0].size > limit_size) {
        alert("Файл больше 5 МБ");
        file_name_elem.style.display = "none";
        file_name_elem.textContent = "";
        this.value = "";
      } else {
        file_name_elem.style.display = "block";
        file_name_elem.textContent = fileName;
      }
    });
}
