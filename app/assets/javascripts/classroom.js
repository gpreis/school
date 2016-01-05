if (window.School === undefined) window.School = {};

School.classrooms = {
  form: function(){
    var priv = {};
    var pub = {};

    pub.init = function(){
      priv.init_student_select2();
      priv.init_course_select2();
      $("form").validate({
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
      });
    };

    priv.init_student_select2 = function(){
      $("#classroom_student_id").select2({
        placeholder: "Selecione um estudante",
        allowClear: true,
        theme: "bootstrap"
      });
    };

    priv.init_course_select2 = function(){
      $("#classroom_course_id").select2({
        placeholder: "Selecione um curso",
        allowClear: true,
        theme: "bootstrap"
      });
    };

    return pub;
  }()
}

School.classrooms.new = School.classrooms.form;
School.classrooms.create = School.classrooms.form;