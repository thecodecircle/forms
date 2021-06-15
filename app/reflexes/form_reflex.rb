# frozen_string_literal: true

class FormReflex < ApplicationReflex
    def font
        puts "##################### font #########################"
        form = Form.find(element.dataset["form"])
        puts "##################### #{form} #########################"
        form.update(font: element.value.to_sym)
        json = JSON.parse(form.payload, object_class: OpenStruct)
        morph "#form-html", render(partial: "forms/html", locals: {form: form, json: json})
        # morph "#fonts", render(partial: "forms/fonts", locals: {form: form})
    end
    
end
  