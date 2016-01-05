if (window.School === undefined) window.School = {};

School.students = {
  form: function(){
    var priv = {};
    var pub = {};

    pub.init = function(){
      $("form").validate(School.validations.default_options);
    }

    return pub;
  }()
}

School.students.new = School.students.form;
School.students.create = School.students.form;
School.students.edit = School.students.form;
School.students.update = School.students.form;