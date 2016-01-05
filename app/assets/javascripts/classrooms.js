if (window.School === undefined) window.School = {};

School.classrooms = {
  form: function(){
    var priv = {};
    var pub = {};

    pub.init = function(){
      priv.init_student_select2();
      priv.init_course_select2();
      $("form").validate(School.validations.default_options);
      $('select').on('change', priv.valid_select2);
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

    priv.valid_select2 = function() {
      $(this).valid();
    };

    return pub;
  }()
}

School.classrooms.new = School.classrooms.form;
School.classrooms.create = School.classrooms.form;