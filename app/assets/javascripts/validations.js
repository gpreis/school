if (window.School === undefined) window.School = {};

School.validations = {};
School.validations.default_options = {
  errorElement: "span",
  errorClass: "help-block",

  highlight: function (element, errorClass, validClass) {
    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
  },
  unhighlight: function (element, errorClass, validClass) {
    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
  },

  errorPlacement: function(error, element) {
    if(element.parent('.input-group')) {
      error.insertAfter(element.parent());
    } else {
      error.insertAfter(element);
    }
  }
}