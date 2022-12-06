import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gruppetto-form-hide"
export default class extends Controller {
  static targets = ['trackSelector', 'trackForm', 'additionalSettings', 'additionalSettingsCaret', 'trackFile', 'trackInfo']

  connect() {
    console.log('Hello from hider side')
  }

  trackForm() {
    this.trackFormTarget.classList.remove('d-none')
    this.trackSelectorTarget.classList.add('d-none')
  }

  trackSelect() {
    this.trackFormTarget.classList.add('d-none')
    this.trackSelectorTarget.classList.remove('d-none')
  }

  additionalSettings () {
    console.log('click')
    if (this.additionalSettingsTarget.classList.contains('d-none')) {
      this.additionalSettingsTarget.classList.remove('d-none')
      this.additionalSettingsCaretTarget.classList.replace('down', 'up')
    } else {
      this.additionalSettingsTarget.classList.add('d-none')
      this.additionalSettingsCaretTarget.classList.replace('up', 'down')
    }
  }

  trackFile() {
    this.trackFileTarget.classList.remove('d-none')
    this.trackInfoTarget.classList.add('d-none')
  }

  noTrackFile() {
    this.trackFileTarget.classList.add('d-none')
    this.trackInfoTarget.classList.remove('d-none')
  }

}
