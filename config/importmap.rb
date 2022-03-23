# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "@rails/actioncable", to: "actioncable.esm.js", preload: true
pin "cable", preload: true

pin_all_from "app/javascript/controllers", under: "controllers", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
