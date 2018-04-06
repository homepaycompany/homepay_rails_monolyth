import Dropzone from 'dropzone';
import 'dropzone/dist/dropzone.css';

function launchDropzone() {
  // disableNextSection();
  if (document.getElementById('js-dropzone-uploaded')) {
    enableNextSection();
  }
  newDropzone();
}

function newDropzone() {
  Dropzone.autoDiscover = false;
  const myDropzone = new Dropzone("#doc-dropzone", {
    dictDefaultMessage: "",
    clickable: "#clickable",
    previewTemplate: document.querySelector('#tpl').innerHTML,
    addRemoveLinks: true,
    dictCancelUpload: "Supprimer",
    dictRemoveFile: "Supprimer",
    dictCancelUploadConfirmation: "Êtes-vous sûr de vouloir supprimer l'image ?",
    // If the upload was successful
    success: function(file, response){
        // Find the preview and the remove button link of the uploaded file and give it an id
        // based of the fileID response from the server
        file.previewTemplate.dataset.token = response.id;
        file.previewTemplate.querySelector(".dz-remove").id = response.id;
    },
    // When the remove button is clicked
    removedfile: function(file){
      // Grab id of uploaded property picture
      var id = file.previewTemplate.querySelector(".dz-remove").id;
      var formToken = document.querySelector('.form-container').dataset.token;

      // Ajax request to delete the file
      $.ajax({
        type: 'DELETE',
        url: '/property_images/' + id,
        data: {property_form_id: formToken},
        dataType: "script",
        success: function(file){
          // Delete property image  preview
          var preview = document.querySelector(`.dz-preview[data-token="${id}"]`);
          preview.parentNode.removeChild(preview);
          console.log("In Ajax request");
          console.log("Removed file");
        }
      });
    },
  });

  // code found on internet to prevent issues with SAFARI and IE browsers
  myDropzone.handleFiles = function(files) {
    var _this5 = this;
    var files_array = [];

    for (var i = 0; i < files.length; i++) {
      files_array.push(files[i]);
    }

    return files_array.map(function(file) {
      return _this5.addFile(file);
    });
  };

  myDropzone.on("success", function(file, response) {
  enableNextSection();
  });
}

function disableNextSection () {
  const b = document.getElementById('js-validate-section');
  b.classList.add('js-block-next-section');
  b.classList.add('disabled');
}

function enableNextSection () {
  const b = document.getElementById('js-validate-section');
  b.innerHTML = "Continuer"
  // b.classList.remove('js-block-next-section');
  // b.classList.remove('disabled');
}

export { launchDropzone }
