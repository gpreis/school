if (window.School === undefined) window.School = {};

School.courses = {
  form: function(){
    var priv = {};
    var pub = {};

    pub.init = function(){
      $("form").validate(School.validations.default_options);
    }

    return pub;
  }()
}

School.courses.new = School.courses.form;
School.courses.create = School.courses.form;
School.courses.edit = School.courses.form;
School.courses.update = School.courses.form;