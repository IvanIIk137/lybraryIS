const projectName = 'arbihunter'

const template = {
  controller: 'plop-templates/controller.hbs',
  binding: 'plop-templates/binding.hbs',
  bindingForController: 'plop-templates/binding_for_controller.hbs',
  page: 'plop-templates/page.hbs',
  model: 'plop-templates/model.hbs',
  repository: 'plop-templates/repository.hbs',
  field: 'plop-templates/field.hbs',
}

module.exports = function(plop) {
  plop.setPartial('projectName', projectName);
  plop.setGenerator('Controller + Binding', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Name:',
      },
      {
        type: 'list',
        name: 'dir',
        message: 'Directory',
        default: 'page_controllers',
        choices: [
          { name: 'page_controllers', value: 'page_controllers' },
          { name: 'common', value: 'common' },
          { name: 'widget_controllers', value: 'widget_controllers' },
        ],
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/controllers/{{dir}}/{{ snakeCase name }}_controller.dart',
        templateFile: template.controller,
      },
      {
        type: 'add',
        path: 'lib/bindings/{{ snakeCase name }}_binding.dart',
        templateFile: template.bindingForController,
      },
    ],
  })

  plop.setGenerator('Controller Only', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Controller name:',
      },
      {
        type: 'list',
        name: 'dir',
        message: 'Directory',
        default: 'page_controllers',
        choices: [
          { name: 'page_controllers', value: 'page_controllers' },
          { name: 'common', value: 'common' },
          { name: 'widget_controllers', value: 'widget_controllers' },
        ],
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/controllers/{{dir}}/{{ snakeCase name }}_controller.dart',
        templateFile: template.controller,
      },
    ],
  })

  plop.setGenerator('Binding Only', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Binding name:',
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/bindings/{{ snakeCase name }}_binding.dart',
        templateFile: template.binding,
      },
    ],
  })

  plop.setGenerator('Page', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Page name:',
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/ui/pages/{{ snakeCase name }}_page/{{ snakeCase name }}_page.dart',
        templateFile: template.page,
      },
      {
        type: 'add',
        path: 'lib/ui/pages/{{ snakeCase name }}_page/components/widget.dart',
      },
     
      {
        type: 'append',
        path: 'lib/routes.dart',
        pattern: /import.*/,
        template: "import 'package:{{> projectName }}/ui/pages/{{ snakeCase name }}_page/{{ snakeCase name }}_page.dart';",
      },
      {
        type: 'append',
        path: 'lib/routes.dart',
        pattern: /plop_page_place.*/,
        template: "    GetPage(name: '/{{ dashCase name }}', page: () => {{ properCase name }}Page()),",
      },
      {
        type: 'append',
        path: 'lib/routes.dart',
        pattern: /plop_method_place.*/,
        template: `
  static void goTo{{ properCase name }}({bool offOne = false, offAll = false}) =>
    _navigate('/{{ dashCase name }}', offOne, offAll);`,
      },
    ],
  })

  plop.setGenerator('Model', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Model name:',
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/data/models/{{ snakeCase name }}_model.dart',
        templateFile: template.model,
      },
    ],
  })

  plop.setGenerator('Repository', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Repository name:',
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/data/repositories/{{ snakeCase name }}_repository.dart',
        templateFile: template.repository,
      },
    ],
  })

  plop.setGenerator('Field', {
    prompts: [
      {
        type: 'input',
        name: 'name',
        message: 'Field name:',
      },
      {
        type: 'returnType',
        name: 'returnType',
        message: 'Return Type (int, String...):',
      },
    ],
    actions: [
      {
        type: 'add',
        path: 'lib/ui/widgets/fields/{{ snakeCase name }}_field.dart',
        templateFile: template.field,
      },
    ],
  })
}



