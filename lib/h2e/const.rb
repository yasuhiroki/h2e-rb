module H2E

  ENML_PROHIBITED_ATTRIBUTES = [
    "id",                "class",        "onclick",
    "ondblclick",        "accesskey",    "data",
    "dynsrc",            "tabindex",     "data-lang",
    "data-conversation", "data-partner", "alt",
  ]

  ENML_HEADER = <<-HEADER
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
  HEADER

  P_CODE_BLOCK_STYLE = {
    "border-top-right-radius": "3px",
    "border-top-left-radius": "3px",
    "border-bottom-right-radius": "3px",
    "border-bottom-left-radius": "3px",
    "background": "#f7f7f7",
    "margin": "1em 0",
  }

  CODE_BLOCK_STYLE = {
    "border-top-right-radius": "3px",
    "border-top-left-radius": "3px",
    "border-bottom-right-radius": "3px",
    "border-bottom-left-radius": "3px",
    "background": "#f7f7f7",
    "margin": "0 0",
    "padding": ".6em 1.2em",
  }

end
