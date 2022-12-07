import { Controller } from "@hotwired/stimulus"


const validations = {
  'gruppetto[name]': /.+/,
  'gruppetto[start]': /.+/,
  'gruppetto[description]': /.+/,
  'gruppetto[avg_speed]': /.+/,
  'gruppetto[difficulty]': /.+/,
  'gruppetto[track][name]': /.+/,
  'gruppetto[track][id]': /.+/,
  'gruppetto[track][address]': /.+/,
  'gruppetto[track][total_km]': /.+/,
  'gruppetto[track][total_vm]': /.+/
}


// const formValid = {
//   form: false,
//   fields: {
//     'gruppetto[name]': false,
//     'gruppetto[start]': false,
//     'gruppetto[description]': false,
//     'gruppetto[avg_speed]': false,
//     'gruppetto[difficulty]': false,
//     'gruppetto[track][name]': false,
//     'gruppetto[track][id]': false,
//     'gruppetto[track][address]': false,
//     'gruppetto[track][total_km]': false,
//     'gruppetto[track][total_vm]': false
//   }
// };

// Connects to data-controller="gruppetto-validator"
export default class extends Controller {
  static targets = ['submit']
  connect() {
    console.log('connected to form validator')
  }

  // formValidate = () => {
  //   if (Object.values(formValid.fields).includes(false)) {
  //     this.submitTarget.disabled = true;
  //   } else {
  //     this.submitTarget.disabled = false;
  //   }
  // };

  changeFieldValid = (field) => {
    field.classList.add('is-valid');
    field.classList.remove('is-invalid');
    // can be used for error messages, but I think they need to be specified
    // field.nextElementSibling.classList.add('invisible');
    // field.nextElementSibling.classList.remove('visible');
    // formValid.fields[String(field.name)] = true;
  };

  changeFieldInvalid = (field) => {
    field.classList.add('is-invalid');
    field.classList.remove('is-valid');
    // can be used for error messages, but I think they need to be specified
    // field.nextElementSibling.classList.add('visible');
    // field.nextElementSibling.classList.remove('invisible');
    // formValid.fields[String(field.name)] = false;
  };

  isValidField(field)  {
    return validations[String(field.name)].test(field.value);
  };

  validateField(event) {
    let field = event.currentTarget;
    if (this.isValidField(field)) {
      this.changeFieldValid(field);
    } else {
      this.changeFieldInvalid(field);
    }
    // this.formValidate();
  }

  validateHiddenFields() {
    document.querySelectorAll('#dependentFields').forEach((div) => {
      if (div.classList.contains('d-none')) {
        div.childNodes.forEach((node) => {
          if (Object.keys(formValid.fields).includes(String(node.name))) {
            formValid.fields[String(node.name)] = true;
          };
        });
      };
    });
    // find all divs with d-none, take all fields in there and validate them true
  }

  validateDependentField(event) {
    let field = event.currentTarget;
    if (field.parentElement.classList.include('d-none')) {

    } else {
      if (this.isValidField(field)) {
        this.changeFieldValid(field);
      } else {
        this.changeFieldInvalid(field);
      }
    }
    // this.formValidate();
  }
}
